class TasksController < ApplicationController

  def index
    
    @tasks = Task.all.order(id: :asc).page(params[:page]).per(5)

    if params[:sort_expired].present?
      @tasks = Task.sort_expired(:sort_expired)
    end

    if params[:sort_priority].present?
      @tasks = Task.sort_priority(:sort_priority)
    end
    
    
    if params[:task].present?
      @task_search = params[:task][:search]
      @task_status = params[:task][:status]
      if params[:task][:search].present? && params[:task][:status].present?
        @tasks = Task.and_sort(@task_search, @task_status)
      elsif params[:task][:search].present?
        @tasks = Task.search_sort(@task_search)
      elsif params[:task][:status].present?
        @tasks = Task.status_sort(@task_status)
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

# <%= form_with url: tasks_path, scope: :task, method: :get, local: true do |form| %>
#   <div class='form-group', class='row'>
#     <%= form.label :name_cont, '検索ボックス', class: 'col-sm2 col-form-label' %>
#     <%= form.text_field :search, class: 'form-control' %>
#     <%= form.submit '検索', name: nil, class: 'btn btn-outline-primary' %>
#   </div>
# <% end %>

# <br>

# <%= form_with url: tasks_path, scope: :task, method: :get, local: true do |form| %>
#   <div class='form-group', class='row'>
#     <%= form.select :status, Task.statuses.keys, class: 'form-control' %>
#     <%= form.submit 'ステータス検索', name: nil, class: 'btn btn-outline-primary' %>
#   </div>
# <% end %>
