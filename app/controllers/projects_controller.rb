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
    @project = Project.new
  end
  
  def create
    @project = Project.new(params[:project])
    
    if @project.save
      redirect_to project_path(@project)
    else
      render :action => "new"
    end
    
  end
  
end
