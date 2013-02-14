# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  
  protect_from_forgery
  include SessionsHelper
  include ProjectsHelper
  include UsersHelper
   
  
  def signed_in
    if(!session[:user_id].nil?)
      return true
    else
      redirect_to :signin
    end    
  end
  
  def is_project_user
    project = Project.find(params[:project_id])
    if (project.users.where(['user_id = ?', current_user.id]).all.any?)
      return true
    else
      flash.keep[:error] = "Du har inga rättigheter för den här sidan!"
      redirect_to projects_path
    end
  end
  

end
