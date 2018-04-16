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

ActiveRecord::Schema.define(version: 20180416064641) do

  create_table "asset_vips", force: :cascade do |t|
    t.string   "name"
    t.integer  "max_house",  default: 5
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

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
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.boolean  "is_duplex",                               default: false
    t.decimal  "floor_height"
    t.integer  "district_id"
    t.string   "logo"
    t.string   "cp_lng"
    t.string   "cp_lat"
    t.string   "contact_name"
    t.string   "status",                                  default: "valid"
    t.integer  "utilies"
    t.string   "join_name"
    t.string   "bedroom"
    t.string   "bathroom"
    t.string   "veranda"
    t.string   "balcony"
    t.string   "refurbishment"
    t.string   "lease_plan"
    t.string   "indoor_theme"
    t.decimal  "guarantee_rate"
    t.string   "duration_of_renovation"
    t.decimal  "deposit"
    t.decimal  "daily_rent"
    t.decimal  "refurbishment_budget"
    t.decimal  "maintain_budget"
    t.decimal  "overdue_price"
    t.decimal  "referral_commission"
    t.decimal  "utilities"
    t.decimal  "VAT_merchant"
    t.decimal  "VAT_personal"
    t.decimal  "ROI_lease"
    t.decimal  "ROI_guarantee"
    t.decimal  "duration_of_lease"
    t.decimal  "duration_of_guarantee"
    t.decimal  "start_up_cost"
    t.decimal  "B_income_rate"
    t.decimal  "platform_income_rate"
    t.decimal  "retail_monthly_rent_pre_tax"
    t.decimal  "retail_guarantee_monthly_income_pre_tax"
    t.decimal  "retail_guarantee_monthly_income"
    t.decimal  "platform_full_lease_total_income"
    t.decimal  "platform_guarantee_total_income"
    t.decimal  "B_full_lease_total_income"
    t.decimal  "B_guarantee_total_income"
    t.decimal  "homey_guarantee_monthly_income_bonus"
    t.decimal  "homey_full_lease_total_income"
    t.decimal  "homey_guarantee_total_income"
    t.index ["district_id"], name: "index_houses_on_district_id"
  end

  create_table "leases", force: :cascade do |t|
    t.decimal  "charter_costs"
    t.decimal  "B_guarantee_yearly_income"
    t.decimal  "platform_guarantee_yearly_income"
    t.decimal  "homey_guarantee_yearly_income_bonus"
    t.integer  "house_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["house_id"], name: "index_leases_on_house_id"
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
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "is_deployee",            default: false
    t.boolean  "is_admin",               default: false
    t.boolean  "is_employee",            default: false
    t.boolean  "is_art",                 default: false
    t.boolean  "is_housekeeper",         default: false
    t.boolean  "is_cmanager",            default: false
    t.boolean  "is_overseer",            default: false
    t.boolean  "is_salesman",            default: false
    t.boolean  "is_salesman_p",          default: false
    t.boolean  "is_imanager",            default: false
    t.boolean  "is_imanager_p",          default: false
    t.boolean  "is_acc",                 default: false
    t.boolean  "is_hr",                  default: false
    t.boolean  "is_design_director",     default: false
    t.boolean  "is_design_assitant",     default: false
    t.boolean  "is_rental_user",         default: false
    t.boolean  "is_asset_user",          default: false
    t.integer  "asset_vip_id"
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
