class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def show; end

  def index
    @search = User.ransack(params[:q])
    @pagy, @users = pagy(@search.result, items: 10)
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      flash[:danger] = t("body.unsuccessfully")
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:danger] = t("body.successfully")
      redirect_to @user
    else
      flash[:danger] = t("body.unsuccessfully")
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
    @user= User.find_by(id:params[:id])
    unless @user
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_type, :status, :image, :notes)
  end
end
