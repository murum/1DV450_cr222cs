# -*- encoding : utf-8 -*-
class UsersController < ApplicationController

  layout 'application'
  
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
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      sign_in @user
      flash[:success] = "Din användare skapades med emailen #{@user.email}"
      redirect_to user_path(@user)
    else
      render :action => "new"
    end
  end
  
end
