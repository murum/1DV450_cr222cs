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
      redirect_to user, :notice => "Logged in"
    else
      flash.now[:error] = 'Inloggning misslyckades Email & Lösenords kombinationen var felaktig.' # Not quite right!
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_url 
  end
  
end
