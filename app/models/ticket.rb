class Ticket < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :status
  belongs_to :project
  belongs_to :user
end
