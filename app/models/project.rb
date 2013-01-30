class Project < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  has_many :tickets
  
  has_and_belongs_to_many :users
end
