class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to account_path, notice: "Account updated successfully."
    else
      render :edit
    end
  end

  def check_password
    if current_user.valid_password?(params[:current_password])
      session[:password_verified] = true
      session[:password_attempts] = 0
      redirect_to account_change_password_path
    else
      session[:password_attempts] ||= 0
      session[:password_attempts] += 1

      if session[:password_attempts] >= 3
        reset_session
        redirect_to new_user_session_path, alert: "Too many failed attempts. Logged out."
      else
        redirect_to account_verify_password_path, alert: "Incorrect password"
      end
    end
  end

  def verify_password
  end

  def change_password
    unless session[:password_verified]
      redirect_to account_verify_password_path
    end
  end

  def update_password
    unless session[:password_verified]
      redirect_to account_verify_password_path and return
    end

    if params[:password] != params[:password_confirmation]
      redirect_to account_change_password_path, alert: "Passwords do not match" and return
    end

    current_user.password = params[:password]

    if current_user.save
      session[:password_verified] = false
      redirect_to account_path, notice: "Password updated successfully"
    else
      redirect_to account_change_password_path, alert: current_user.errors.full_messages.join(", ")
    end
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email)
  end
end
