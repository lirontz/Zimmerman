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

ActiveRecord::Schema.define(:version => 20120721163227) do

  create_table "assets", :force => true do |t|
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.integer  "site_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "cities", :force => true do |t|
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "name",       :default => "", :null => false
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "requests", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.integer  "user_id",            :default => 0,                     :null => false
    t.integer  "how_many_rooms",                                        :null => false
    t.datetime "start_date",         :default => '2012-03-10 12:09:26', :null => false
    t.datetime "end_date",           :default => '2012-03-10 12:09:26', :null => false
    t.integer  "price_from",                                            :null => false
    t.integer  "price_to",                                              :null => false
    t.integer  "room_properties_id", :default => 0,                     :null => false
    t.boolean  "sms_enabled",        :default => false,                 :null => false
    t.integer  "room_type_id",       :default => 0,                     :null => false
    t.integer  "region_id",          :default => 0,                     :null => false
    t.integer  "city_id"
    t.integer  "status",             :default => 0,                     :null => false
  end

  create_table "requests_room_properties", :id => false, :force => true do |t|
    t.integer "request_id"
    t.integer "room_property_id"
  end

  create_table "responses", :force => true do |t|
    t.integer  "request_id"
    t.integer  "site_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "status",     :default => 0, :null => false
  end

  create_table "responses_rooms", :id => false, :force => true do |t|
    t.integer "response_id"
    t.integer "room_id"
  end

  add_index "responses_rooms", ["response_id", "room_id"], :name => "index_responses_rooms_on_response_id_and_room_id"

  create_table "room_properties", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "room_properties_rooms", :id => false, :force => true do |t|
    t.integer "room_property_id"
    t.integer "room_id"
  end

  add_index "room_properties_rooms", ["room_property_id", "room_id"], :name => "index_room_properties_rooms_on_room_property_id_and_room_id"

  create_table "room_properties_sites", :id => false, :force => true do |t|
    t.integer "room_property_id"
    t.integer "site_id"
  end

  add_index "room_properties_sites", ["room_property_id", "site_id"], :name => "index_room_properties_sites_on_room_property_id_and_site_id"

  create_table "room_site_properties", :force => true do |t|
    t.integer  "room_id"
    t.integer  "room_property_id"
    t.integer  "price"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "room_site_properties", ["room_id", "room_property_id"], :name => "index_room_site_properties_on_room_id_and_room_property_id"

  create_table "room_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rooms", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "site_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "price",       :default => 0, :null => false
  end

  create_table "site_owners", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "phone"
    t.date     "birthday"
    t.boolean  "sms_enabled"
    t.boolean  "terms_of_use_confirmed"
    t.string   "gender"
  end

  add_index "site_owners", ["email"], :name => "index_site_owners_on_email", :unique => true
  add_index "site_owners", ["reset_password_token"], :name => "index_site_owners_on_reset_password_token", :unique => true

  create_table "site_properties", :force => true do |t|
    t.integer  "site_id"
    t.integer  "room_property_id"
    t.integer  "price"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "site_properties", ["site_id", "room_property_id"], :name => "index_site_properties_on_site_id_and_room_property_id"

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.integer  "region_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "site_owner_id",      :default => 0,  :null => false
    t.integer  "room_type_id",       :default => 0,  :null => false
    t.text     "description",        :default => "", :null => false
    t.text     "what_included",      :default => "", :null => false
    t.string   "phone"
    t.string   "mobile"
    t.string   "fax"
    t.string   "email",              :default => "", :null => false
    t.string   "contact_point_name", :default => "", :null => false
    t.string   "address",            :default => "", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email",                  :default => "",   :null => false
    t.string   "encrypted_password",     :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "phone"
    t.date     "birthday"
    t.date     "partner_birthday"
    t.boolean  "terms_of_use_confirmed"
    t.string   "gender"
    t.boolean  "sms_enabled",            :default => true, :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
