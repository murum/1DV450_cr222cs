# -*- encoding : utf-8 -*-
class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :status
      t.references :user
      t.references :project


      t.string :name, :limit => 80
      t.string :description, :limit => 2500
      

      t.timestamps
    end
  end
end
