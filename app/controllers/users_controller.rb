class UsersController < ApplicationController
  
  def index
    @users = User.all()
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
  
  def create
    @user = User.new
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.email = params[:email]
    @user.password = params[:password]
    
    if @user.save
      redirect_to user_path(@user)
    else
      #error handling
    end
  end
  
end