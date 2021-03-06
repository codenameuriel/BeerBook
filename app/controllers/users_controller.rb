class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize
  
  def show
  end

  def new 
    @user = User.new
  end

  def create 
    @user = User.create(user_params)

    if @user.valid? 
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new 
    end
  end

  def edit 
  end

  def update 
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private 

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
