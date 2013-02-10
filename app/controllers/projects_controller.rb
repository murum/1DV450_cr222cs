# -*- encoding : utf-8 -*-
class ProjectsController < ApplicationController
  
  def index
    @projects = Project.all()
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end
  
  def new 
    @users = User.all()
    @project = Project.new
  end
  
  def add_user 
    add_project_user(Project.find(params[:id]), User.find(params[:user][:user_id]) )
  end
  
  def create
    @project = Project.new(params[:project])
    @project.user_id = current_user.id
    
    if @project.save
      @project.users << User.find(current_user.id)
      redirect_to project_path(@project)
    else
      render :action => "new"
    end
    
  end
  
end
