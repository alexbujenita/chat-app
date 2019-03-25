class UsersController < ApplicationController

  before_action :get_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params())
    if @user.save
      log_in @user
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
    
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :nickname, :age, :email, :password, :password_confirmation)
  end
end
