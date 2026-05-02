class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo, only: %i[ show edit update destroy ]

  # GET /todos or /todos.json
  def index
    @todos = current_user.todos
  end

  def completed
    @todos = current_user.todos.where(completed: true)
  end

  # GET /todos/1 or /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos or /todos.json
  def create
    @todo = current_user.todos.build(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: "Todo was successfully created." }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1 or /todos/1.json
  def update
    if @todo.update(todo_params)
      redirect_to todo_path(@todo, return_to: params[:return_to]), notice: "Todo was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /todos/1 or /todos/1.json
  def destroy
    @todo.destroy!

    respond_to do |format|
      format.html { redirect_to todos_path, notice: "Todo was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = current_user.todos.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_params
      #params.expect(todo: [ :title, :priority, :completed, :user_id, :category_id ])
      params.require(:todo).permit(:title, :priority, :completed, :category_id, :notes)
    end
end
