# -*- encoding : utf-8 -*-
class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :user  
  
      t.string :name, :limit => 80
      t.string :description, :limit => 2500
      t.date :start_date
      t.date :end_date
      
      t.timestamps
    end
  end
end
