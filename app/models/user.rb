class User < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :projects
  has_many :tickets
end
