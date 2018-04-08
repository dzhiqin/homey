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

ActiveRecord::Schema.define(version: 20180408041814) do

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "guest_id"
    t.integer  "user_id"
    t.date     "last_follow_date"
    t.string   "memo"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "name"
  end

  create_table "guest_options", force: :cascade do |t|
    t.integer  "guest_id"
    t.integer  "option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guests", force: :cascade do |t|
    t.string   "name"
    t.string   "country_code"
    t.string   "job"
    t.string   "email"
    t.string   "wechat"
    t.string   "phone"
    t.string   "company"
    t.string   "referrer"
    t.string   "house_options"
    t.string   "house_district"
    t.string   "house_type"
    t.string   "liked_estate"
    t.string   "landscape"
    t.string   "house_floor"
    t.string   "house_parking"
    t.string   "house_furnished"
    t.string   "house_XIS"
    t.date     "check_in_date"
    t.string   "duration"
    t.string   "budget"
    t.string   "has_pet"
    t.string   "want_buy"
    t.string   "other_requests"
    t.string   "status"
    t.integer  "approach_id"
    t.string   "approach"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "row_order"
    t.index ["row_order"], name: "index_guests_on_row_order"
  end

  create_table "house_images", force: :cascade do |t|
    t.integer  "house_id"
    t.string   "image"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["house_id"], name: "index_house_images_on_house_id"
  end

  create_table "houses", force: :cascade do |t|
    t.datetime "last_login"
    t.string   "house_id"
    t.string   "contact_phone"
    t.string   "district"
    t.string   "address"
    t.string   "gated_community"
    t.string   "landscape"
    t.string   "greening"
    t.string   "parking_space"
    t.string   "structure"
    t.string   "spatial_planning"
    t.date     "completion_date"
    t.decimal  "floor_height_single"
    t.decimal  "floor_height_duplex"
    t.decimal  "property_area"
    t.decimal  "actual_area"
    t.string   "house_upgrade"
    t.string   "house_furnishings"
    t.string   "gas_pipeline"
    t.string   "elevator"
    t.decimal  "public_area"
    t.string   "wall_malleability"
    t.string   "house_malleability"
    t.string   "public_passage"
    t.string   "sercurity_service"
    t.string   "charter_costs"
    t.decimal  "monthly_rent"
    t.string   "payment_method"
    t.decimal  "price_before_operation"
    t.string   "transportation_convenience"
    t.string   "shopping_convenience"
    t.string   "medical_convenience"
    t.string   "education_resources"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.boolean  "is_duplex",                  default: false
    t.decimal  "floor_height"
    t.integer  "district_id"
    t.string   "logo"
    t.string   "cp_lng"
    t.string   "cp_lat"
    t.string   "contact_name"
    t.string   "status",                     default: "valid"
    t.index ["district_id"], name: "index_houses_on_district_id"
  end

  create_table "options", force: :cascade do |t|
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refer_guests", force: :cascade do |t|
    t.string   "name"
    t.string   "contact"
    t.integer  "guest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

end
