# -*- encoding : utf-8 -*-
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130207151203) do

  create_table "projects", :force => true do |t|
    t.integer  "user_id"
    t.string   "name",        :limit => 80
    t.string   "description", :limit => 2500
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "projects_users", :force => true do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  add_index "projects_users", ["project_id", "user_id"], :name => "index_projects_users_on_project_id_and_user_id"

  create_table "statuses", :force => true do |t|
    t.string   "status_name", :limit => 50
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "tickets", :force => true do |t|
    t.integer  "status_id"
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "name",        :limit => 80
    t.string   "description", :limit => 2500
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name",      :limit => 30
    t.string   "last_name",       :limit => 50
    t.string   "email",           :limit => 150
    t.string   "password",        :limit => 50
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "password_digest"
  end

end
