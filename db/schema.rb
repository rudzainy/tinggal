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

ActiveRecord::Schema.define(version: 20160604223720) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agents", force: :cascade do |t|
    t.string "agent_id"
    t.string "email"
  end

  create_table "appointments", force: :cascade do |t|
    t.integer "user_id"
    t.string  "agent_id",   default: "12345"
    t.integer "listing_id"
    t.date    "date"
  end

  create_table "list_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id",    null: false
    t.integer  "listing_id", null: false
    t.integer  "like"
  end

  create_table "listings", force: :cascade do |t|
    t.string "ListingID"
    t.string "BuildUp"
    t.string "IsSale"
    t.string "IsRent"
    t.string "Postalcode"
    t.string "AskingPrice"
    t.string "RentalPrice"
    t.string "NoOfBedRooms"
    t.string "NoOfBathRooms"
    t.string "City"
    t.string "Township"
    t.string "StateCode"
    t.string "ProType"
    t.string "TenureCode"
    t.string "AdvertiseDate"
    t.string "PostedDate"
    t.string "LastModified"
    t.string "CreatedDate"
    t.string "BuildingName"
    t.string "agent_id"
  end

  create_table "property_category_types", force: :cascade do |t|
    t.string "ProCatType"
    t.string "Description"
  end

  create_table "property_group_types", force: :cascade do |t|
    t.string "ProGrpType"
    t.string "ProCatType"
    t.string "Description"
  end

  create_table "property_types", force: :cascade do |t|
    t.string "ProType"
    t.string "ProCatType"
    t.string "ProGrpType"
    t.string "Description"
  end

  create_table "tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id",    null: false
    t.integer  "listing_id", null: false
    t.string   "name",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "username"
    t.string   "email",                         null: false
    t.string   "reg_type",        default: "0"
    t.string   "reg_key"
    t.string   "password_digest"
    t.string   "picture_url"
    t.string   "gender"
    t.string   "age_range"
    t.string   "maritial_status"
    t.integer  "salary"
    t.string   "user_type"
    t.string   "location"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

end
