class UsersController < ApplicationController

  before_action :get_user, only: [:show, :edit, :update]
  before_action :logged_in_user, only: [:edit, :update, :show, :index]
  before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:name, :nickname, :age, :email, :password, :password_confirmation))
    if @user.save
      log_in @user
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
    
  end

  def update
    if @user.update(user_params(:name, :email, :password, :password_confirmation))
      flash[:success] = "Profile updated"
      redirect_to user_path(current_user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path(current_user)
    end
  end

  def show
    
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params(*args)
    params.require(:user).permit(*args)
  end

 
end
