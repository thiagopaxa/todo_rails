class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy,
                                  :add_favorite, :remove_favorite]

  before_action :favorite_todos_list, only: [:index, :favorites]
  before_action :authenticate_user!

  # GET /todos
  # GET /todos.json
  def index
    @todos = TodoPresenter.wrap(Todo.public_to current_user)
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
    @todo.tasks.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = Todo.new(todo_params)
    @todo.user = current_user

    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_url, notice: 'Todo was successfully created.' }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    @todo.user = current_user

    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to todos_url, notice: 'Todo was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo.tasks.each(&:destroy)
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to todos_url, notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def favorites
    @todos = TodoPresenter.wrap(current_user.favorite_todos)
    render :index
  end

  def add_favorite
    @todo.favorites.create(following_user: current_user)
    render json: @todo, status: 200
  end

  def remove_favorite
    @todo.following_users.delete(current_user)
    render json: @todo, status: 200
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    def favorite_todos_list
      @favorite_todo_ids = current_user.favorite_todos.all.map(&:id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params
        .require(:todo)
        .permit(:title, :private, :completed, tasks_attributes: [:body, :_destroy, :id])
    end
end
