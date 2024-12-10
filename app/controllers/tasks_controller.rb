class TasksController < ApplicationController
  before_action :set_board

  def create
    @task = @board.tasks.new(task_params)
    if @task.save
      redirect_to @board
    else
      render :new
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to @task.board
    else
      render :edit
    end
  end

  private

  def set_board
    @board = Board.find(params[:board_id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :category_id, :user_id)
  end
end
