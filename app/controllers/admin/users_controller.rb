class Admin::UsersController < ApplicationController
  before_action :require_admin

  def index
    @users = User.all.order(id: :asc)
  end

  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks.includes(:user).page(params[:page]).per(5)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_user_path(@user), notice: "ユーザ「#{@user.name}」を登録しました。"
    else
      render :new
    end
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "ユーザ「#{@user.name}」を更新しました。"
    else      
      redirect_to tasks_path, notice: '少なくとも1つ、管理者が必要になります。2つ以上ないとこの操作は行えません。'
    end
  end

  def destroy
    @user = User.find(params[:id])    
    if @user.destroy
      redirect_to admin_users_url, notice: "ユーザ「#{@user.name}」を削除しました。"      
    else      
      redirect_to tasks_path, notice: '少なくとも1つ、管理者が必要になります。2つ以上ないとこの操作は行えません。'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end

  def require_admin
    redirect_to root_path unless current_user.admin?
  end

end