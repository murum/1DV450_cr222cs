# -*- encoding : utf-8 -*-
class SessionsController < ApplicationController
  
  def new
    if current_user
      redirect_to current_user
    end 
  end
  
  def create 
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash.keep[:success] = "Du loggades in!"
      redirect_to user
    else
      flash.now[:error] = 'Inloggning misslyckades Email & Lösenords kombinationen var felaktig.'
      render 'new'
    end
  end
  
  def destroy
    flash.keep[:success] = "Du loggades ut!"
    sign_out
    redirect_to root_url
  end
  
end
