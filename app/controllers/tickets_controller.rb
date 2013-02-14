# -*- encoding : utf-8 -*-
class TicketsController < ApplicationController
  
  before_filter :signed_in
  before_filter :is_project_user, :only => [:show, :destroy, :edit, :update]
  
  def index
    @tickets = Ticket.all
  end
  
  def show
    @ticket = Ticket.find(params[:id])
  end
  
  def destroy
    @project = is_project_member(params[:id])
    if(!@project)
      @ticket = Ticket.find(params[:id])
      @project = Project.find(params[:project_id])
      @ticket.destroy
      flash.keep[:success] = "Du tog bort en ticket"
      redirect_to project_path @project
    end
  end
  
  def new 
    @ticket = Ticket.new
    @ticket.project_id = params[:project_id]
  end
  
  def create
    @ticket = Ticket.new(params[:ticket])
    @ticket.project_id = params[:project_id]
    @project = Project.find params[:project_id]
    
    if @ticket.save
      flash.keep[:success] = "Du skapade en ticket"
      redirect_to project_path @project
    else
      render :action => "new"
    end
  end
  
  def edit 
    @ticket = Ticket.find(params[:id])
  end
  
  def update
    
    @ticket = Ticket.find(params[:id])
    @project = Project.find(params[:project_id])
    
    if @ticket.update_attributes(params[:ticket])
      
      flash.keep[:success] = "Du uppdaterade en ticket"
      redirect_to project_path @project
      
    else
      render :action => "edit"
    end
    
  end
  
end
