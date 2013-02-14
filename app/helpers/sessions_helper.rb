# -*- encoding : utf-8 -*-
module SessionsHelper
  def sign_in(user)
    session[:user_id] = user.id
  end
  
  def signed_in?
    return !session[:user_id].nil?
  end
  
  def sign_out
    session[:user_id] = nil
  end
  
  def current_user=(user)
    session[:user_id] = @user
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
end
