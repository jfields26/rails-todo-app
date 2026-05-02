class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :todos, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validate :password_complexity

  def password_complexity
    return if password.blank?
    unless password.match?(/(?=.*[A-Z])(?=.*[\d\W])/)
      errors.add :password, "must include at least one uppercase letter and one number or special character"
    end
  end
end
