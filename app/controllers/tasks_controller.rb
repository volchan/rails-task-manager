class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    # @task.save ? redirect_to task_path(@task) : render :new
    if @task.save
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def edit
  end

  def update
    # @task.update(task_params) ? redirect_to task_path(@task) : render :edit
    if @task.update(task_params)
      if task_params[:done]
        redirect_to root_path
      else
        redirect_to task_path(@task)
      end
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:description, :done)
  end
end
