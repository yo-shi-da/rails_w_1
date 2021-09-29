class TasksController < ApplicationController

  def index
    if sort_params.present?
      @tasks = Task.sort_tasks(sort_params)
    else
      @tasks = Task.all
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      redirect_to @task, notice: "タスク「#{@task.name}を登録しました。」"	
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{task.name}を更新しました」"
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "タスクを「#{task.name}」削除しました。"
  end

  private
  def task_params
    params.require(:task).permit(:name, :description, :expired_at, :status, :priority)
  end

  def sort_params
    params.permit(:sort_expired)
  end

end
