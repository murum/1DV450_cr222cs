# -*- encoding : utf-8 -*-
class AddPasswordSaltToUsers < ActiveRecord::Migration
  def change
    add_column :users, :salt, :string
  end
end
