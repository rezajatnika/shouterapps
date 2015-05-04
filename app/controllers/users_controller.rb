class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_param)
    if @user.save
      redirect_to root_path, success: 'User was successfully created.'
    else
      render :new
    end
  end

  def check_email
    @user = User.find_by_email(params[:user][:email])
    if @user.present?
      render json: !@user, status: 422
    else
      render json: !@user, status: 200
    end
  end

  private

  def user_param
    user_attr = [:name, :email, :password, :password_confirmation, :avatar_image]
    params.require(:user).permit(*user_attr)
  end
end
