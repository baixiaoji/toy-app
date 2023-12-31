class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    p params
    @user = User.find(params[:id])
  end
end
