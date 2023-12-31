class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    p params
    @user = User.find(params[:id])
  end


  def create
    @user = User.new(user_params)
    if @user.save
      # wait
      p "success"
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
