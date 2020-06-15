class Admin::UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'そのままログインしちゃいました'
      login @user
      redirect_to admin_user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = 'ユーザーを編集しました。'
      redirect_to admin_user_path
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "ユーザー「#{@user.name}」を削除しました。"
    redirect_to admin_users_path
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :college)
    end
end
