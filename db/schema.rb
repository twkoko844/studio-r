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

ActiveRecord::Schema.define(:version => 20150121072843) do

  create_table "bookedmaterials", :force => true do |t|
    t.integer  "booking_id"
    t.integer  "material_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "bookedmaterials", ["booking_id"], :name => "index_bookedmaterials_on_booking_id"
  add_index "bookedmaterials", ["material_id"], :name => "index_bookedmaterials_on_material_id"

  create_table "bookings", :force => true do |t|
    t.string   "book_id"
    t.integer  "member_id"
    t.date     "date"
    t.integer  "from"
    t.integer  "to"
    t.integer  "room_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "bookings", ["member_id"], :name => "index_bookings_on_member_id"
  add_index "bookings", ["room_id"], :name => "index_bookings_on_room_id"

  create_table "material_kinds", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "materials", :force => true do |t|
    t.integer  "material_kind_id"
    t.string   "name"
    t.datetime "deleted_at"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.boolean  "suspend",          :default => false
  end

  add_index "materials", ["material_kind_id"], :name => "index_materials_on_material_kind_id"

  create_table "members", :force => true do |t|
    t.string   "name",                               :null => false
    t.string   "hashed_password",                    :null => false
    t.string   "tel"
    t.string   "email"
    t.boolean  "admin",           :default => false, :null => false
    t.datetime "deleted_at"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "suspend",         :default => false
  end

  create_table "room_images", :force => true do |t|
    t.integer  "room_id",      :null => false
    t.binary   "data"
    t.string   "content_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "room_images", ["room_id"], :name => "index_room_images_on_room_id"

  create_table "rooms", :force => true do |t|
    t.string   "name"
    t.datetime "deleted_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
