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
      reset_session
      login_in @user
      # wait
      flash[:success] = "welcome to the sample app"
      redirect_to @user # redirect_to user_url(@user)
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
    
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
