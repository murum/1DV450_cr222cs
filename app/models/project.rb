# encoding: utf-8

class Project < ActiveRecord::Base
  attr_accessible :user_id, :name, :description, :start_date, :end_date
  
  belongs_to :user
  has_many :tickets
  
  has_and_belongs_to_many :users
  
  validates :name, :presence => { :message => "Du måste ange ett namn för projektet" }
  validates :description, :presence => { :message => "Du måste ange en beskrivning för projektet" }
  
end
