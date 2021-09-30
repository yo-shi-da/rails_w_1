class TasksController < ApplicationController

  def index
    
    @tasks = Task.all.order(id: :asc)

    if params[:sort_expired].present?
      @tasks = Task.sort_expired(:sort_expired)
    end

    if params[:sort_priority].present?
      @tasks = Task.sort_priority(:sort_priority)
    end

    if params[:task].present?
      if params[:task][:search].present? && params[:task][:status].present?
        @tasks = Task.where(status: params[:task][:status])
      elsif params[:task][:search].present?
        @tasks = Task.where('name LIKE ?', "%#{params[:task][:search]}%") 
      elsif params[:task][:status].present?
        @tasks = Task.where(status: params[:task][:status])
      end
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

end

# if params[:task].present?
#   @tasks = Task.all.order(id: :asc)
# elsif params[:search].present?
#   @tasks = Task.where('name LIKE ?', "%#{params[:search]}%") 
# elsif params[:status].present?
#   @tasks = Task.where(status: params[:task][:status])
# else
#   @tasks = Task.all.order(id: :desc)
# end
