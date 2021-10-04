class TasksController < ApplicationController

  def index
    
    @tasks = current_user.tasks.all.includes(:user).page(params[:page]).per(5)

    if params[:sort_expired].present?
      @tasks = current_user.tasks.sort_expired(:sort_expired).page(params[:page]).per(5)
    end

    if params[:sort_priority].present?
      @tasks = current_user.tasks.sort_priority(:sort_priority).page(params[:page]).per(5)
    end    
    
    if params[:task].present?
      @task_search = params[:task][:search]
      @task_status = params[:task][:status]
      if params[:task][:search].present? && params[:task][:status].present?
        @tasks = current_user.tasks.and_sort(@task_search, @task_status).page(params[:page]).per(5)
      elsif params[:task][:search].present?
        @tasks = current_user.tasks.search_sort(@task_search).page(params[:page]).per(5)
      elsif params[:task][:status].present?
        @tasks = current_user.tasks.status_sort(@task_status).page(params[:page]).per(5)
      end
    end
    
  end

  def show
    @task = current_user.tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
  
    if @task.save
      redirect_to @task, notice: "タスク「#{@task.name}を登録しました。」"	
    else
      render :new
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    task = current_user.tasks.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{task.name}を更新しました」"
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "タスクを「#{task.name}」削除しました。"
  end

  private
  def task_params

    params.require(:task).permit(:name, :description, :expired_at, :status, :priority)
  end

end