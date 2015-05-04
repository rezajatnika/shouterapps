class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :index]
  before_action :correct_user,   only: [:edit, :update]
  before_action :logged_in,      only: [:new, :create]

  def index
    @users = User.all.page(params[:page])
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user, success: 'Profile was successfully updated.'
    else
      render :edit
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

  def user_params
    user_attr = [:name, :email, :password, :password_confirmation, :avatar_image,
      :remote_avatar_image_url]
    params.require(:user).permit(*user_attr)
  end

  def logged_in_user
    unless logged_in?
      store_location
      redirect_to login_path, danger: 'Please login first!'
    end
  end

  def logged_in
    redirect_to root_path, info: 'Already registered!' if logged_in?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to current_user unless current_user?(@user)
  end
end
