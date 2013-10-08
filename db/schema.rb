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

ActiveRecord::Schema.define(:version => 20131007184720) do

  create_table "fine_print_agreements", :force => true do |t|
    t.string   "name",                                                                                        :null => false
    t.integer  "version",                                                                                     :null => false
    t.text     "content",                                                                                     :null => false
    t.string   "confirmation_text",    :default => "I have read and agree to the terms and conditions above", :null => false
    t.boolean  "display_name",         :default => true
    t.boolean  "display_version",      :default => false
    t.boolean  "display_updated",      :default => false
    t.boolean  "display_confirmation", :default => true
    t.boolean  "ready",                :default => false
    t.datetime "created_at",                                                                                  :null => false
    t.datetime "updated_at",                                                                                  :null => false
  end

  add_index "fine_print_agreements", ["name", "version"], :name => "index_fine_print_agreements_on_name_and_version"

  create_table "fine_print_user_agreements", :force => true do |t|
    t.integer  "agreement_id", :null => false
    t.integer  "user_id",      :null => false
    t.string   "user_type",    :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "fine_print_user_agreements", ["agreement_id"], :name => "index_fine_print_user_agreements_on_agreement_id"
  add_index "fine_print_user_agreements", ["user_id", "user_type", "agreement_id"], :name => "index_fine_print_u_a_on_u_id_and_u_type_and_a_id"

  create_table "openstax_connect_users", :force => true do |t|
    t.integer  "openstax_uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "openstax_connect_users", ["openstax_uid"], :name => "index_openstax_connect_users_on_openstax_uid", :unique => true
  add_index "openstax_connect_users", ["username"], :name => "index_openstax_connect_users_on_username", :unique => true

  create_table "users", :force => true do |t|
    t.integer  "openstax_connect_user_id"
    t.boolean  "is_administrator"
    t.boolean  "is_registered"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "users", ["openstax_connect_user_id"], :name => "index_users_on_openstax_connect_user_id", :unique => true

end
