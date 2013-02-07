# -*- encoding : utf-8 -*-

class Ticket < ActiveRecord::Base
  attr_accessible :status_id, :user_id, :project_id, :name, :description
  
  belongs_to :status
  belongs_to :project
  belongs_to :user
  
  validates :name, :presence => { :message => "Du måste ange ett namn" }
  validates :description, :presence => { :message => "Du måste ange en beskrivning" }
end
