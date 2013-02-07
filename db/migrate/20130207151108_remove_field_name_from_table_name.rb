# -*- encoding : utf-8 -*-
class RemoveFieldNameFromTableName < ActiveRecord::Migration
  def up
    remove_column :users, :salt
  end

  def down
    add_column :table_names, :field_name, :datatype
  end
end
