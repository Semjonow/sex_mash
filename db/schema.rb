# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20121128225031) do

  create_table "locations", :force => true do |t|
    t.integer  "user_id"
    t.string   "country",    :default => "",    :null => false
    t.string   "city",       :default => "",    :null => false
    t.string   "address",    :default => "",    :null => false
    t.float    "lat",        :default => 0.0,   :null => false
    t.float    "lng",        :default => 0.0,   :null => false
    t.boolean  "gmaps",      :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "reciever_id"
    t.string   "subject",     :default => "", :null => false
    t.string   "body",        :default => "", :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "photos", :force => true do |t|
    t.integer  "user_id"
    t.string   "pid",        :default => "", :null => false
    t.string   "src_small",  :default => "", :null => false
    t.string   "src_big",    :default => "", :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "photos", ["pid"], :name => "index_photos_on_pid", :unique => true

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "name",       :default => "",           :null => false
    t.string   "logo",       :default => "",           :null => false
    t.string   "link",       :default => "",           :null => false
    t.string   "gender",     :default => "",           :null => false
    t.date     "birthday",   :default => '2012-11-22', :null => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",              :default => "", :null => false
    t.string   "username",           :default => "", :null => false
    t.string   "encrypted_password", :default => "", :null => false
    t.string   "password_salt",      :default => "", :null => false
    t.string   "provider",           :default => "", :null => false
    t.string   "uid",                :default => "", :null => false
    t.string   "access_token",       :default => "", :null => false
    t.string   "slug",               :default => "", :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["provider", "uid"], :name => "index_users_on_provider_and_uid", :unique => true
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  add_foreign_key "locations", "users", :name => "locations_user_id_fk", :dependent => :delete

  add_foreign_key "messages", "users", :name => "messages_reciever_id_fk", :column => "reciever_id", :dependent => :delete
  add_foreign_key "messages", "users", :name => "messages_sender_id_fk", :column => "sender_id", :dependent => :delete

  add_foreign_key "photos", "users", :name => "photos_user_id_fk", :dependent => :delete

  add_foreign_key "profiles", "users", :name => "profiles_user_id_fk", :dependent => :delete

end
