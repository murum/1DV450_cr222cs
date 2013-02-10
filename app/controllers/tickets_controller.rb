# -*- encoding : utf-8 -*-
class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end
  
  def show
    @ticket = Ticket.find(params[:id])
  end
  
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to tickets_path
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
      redirect_to project_path @project
    else
      render :action => "new"
    end
    
  end
end
