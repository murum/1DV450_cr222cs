# -*- encoding : utf-8 -*-
class Status < ActiveRecord::Base
  attr_accessible :status_name
  has_many :tickets
end
