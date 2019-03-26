class GroupsController < ApplicationController

  before_action :correct_user, :users, only: [:new]

  def new
    @group = Group.new
  end

  private
  def users
    @users = User.all - [current_user]
  end
end
