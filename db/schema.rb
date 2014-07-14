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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140714100625) do

  create_table "accessories", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "price"
    t.integer  "user_id"
    t.integer  "model_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accessories", ["model_id"], name: "index_accessories_on_model_id", using: :btree
  add_index "accessories", ["user_id"], name: "index_accessories_on_user_id", using: :btree

  create_table "accessoriesmodels", force: true do |t|
    t.integer  "model_id"
    t.integer  "accessory_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accessoriesmodels", ["accessory_id"], name: "index_accessoriesmodels_on_accessory_id", using: :btree
  add_index "accessoriesmodels", ["model_id"], name: "index_accessoriesmodels_on_model_id", using: :btree
  add_index "accessoriesmodels", ["user_id"], name: "index_accessoriesmodels_on_user_id", using: :btree

  create_table "brands", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "brands", ["user_id"], name: "index_brands_on_user_id", using: :btree

  create_table "colours", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "colours", ["user_id"], name: "index_colours_on_user_id", using: :btree

  create_table "equipment", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "price"
    t.integer  "user_id"
    t.integer  "brand_id"
    t.integer  "model_id"
    t.integer  "accessory_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "town"
    t.string   "city"
    t.string   "post_code"
    t.string   "telephone"
    t.string   "mobile"
    t.string   "email"
    t.datetime "dob"
    t.string   "customer_note"
    t.date     "purchase_date"
    t.integer  "customer_id"
    t.string   "serial_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "retailer_id"
    t.datetime "selling_date"
    t.boolean  "sold_to_customer", default: false
    t.boolean  "sold_to_retailer", default: false
    t.integer  "colour_id"
  end

  add_index "equipment", ["brand_id"], name: "index_equipment_on_brand_id", using: :btree
  add_index "equipment", ["model_id"], name: "index_equipment_on_model_id", using: :btree
  add_index "equipment", ["serial_number"], name: "index_equipment_on_serial_number", unique: true, using: :btree
  add_index "equipment", ["user_id"], name: "index_equipment_on_user_id", using: :btree

  create_table "jobs", force: true do |t|
    t.datetime "date_of_job"
    t.text     "service_notes"
    t.string   "time_spent"
    t.string   "claimed"
    t.string   "warrenty_job"
    t.string   "servicetech"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "models", force: true do |t|
    t.integer  "brand_id"
    t.string   "name"
    t.string   "color"
    t.string   "manufacturer"
    t.string   "warranty"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "serial_no_location"
  end

  add_index "models", ["brand_id"], name: "index_models_on_brand_id", using: :btree
  add_index "models", ["user_id"], name: "index_models_on_user_id", using: :btree

  create_table "retailer_groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sale_histories", force: true do |t|
    t.integer  "serial_no"
    t.integer  "brand_id"
    t.integer  "model_id"
    t.datetime "selling_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "seller_id"
    t.integer  "buyer_id"
    t.integer  "equipment_id"
  end

  add_index "sale_histories", ["brand_id"], name: "index_sale_histories_on_brand_id", using: :btree
  add_index "sale_histories", ["buyer_id"], name: "index_sale_histories_on_buyer_id", using: :btree
  add_index "sale_histories", ["equipment_id"], name: "index_sale_histories_on_equipment_id", using: :btree
  add_index "sale_histories", ["model_id"], name: "index_sale_histories_on_model_id", using: :btree
  add_index "sale_histories", ["seller_id"], name: "index_sale_histories_on_seller_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "contact_person"
    t.string   "website"
    t.integer  "retailer_group_id"
    t.integer  "role_id"
    t.string   "retailer_name"
    t.string   "phone_number"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["retailer_group_id"], name: "index_users_on_retailer_group_id", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
