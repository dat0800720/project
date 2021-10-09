class UsersController < ApplicationController
  before_action :find_user, only: [:show ,:edit, :update, :destroy]
  load_and_authorize_resource

  def show
    @user = User.find_by(id: params[:id])
  end

  def index
    @users = User.all  
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private
  def find_user
    @user=User.find_by(id:params[:id])
    unless @user
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_type, :status, :image)
  end
end
