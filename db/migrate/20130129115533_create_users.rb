class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :first_name, :limit => 30
      t.string :last_name, :limit => 50
      t.string :email, :limit => 150
      t.string :password, :limit => 50

      t.timestamps
    end
  end
end
