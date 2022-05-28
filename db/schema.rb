# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_05_28_152115) do

  create_table "accepted_offers", force: :cascade do |t|
    t.integer "offer_id"
    t.integer "company_id"
    t.datetime "offer_start"
    t.datetime "offer_end"
    t.integer "number_of_redeems"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "image"
    t.string "company_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "offers", force: :cascade do |t|
    t.string "offer_name"
    t.text "offer_description"
    t.integer "small_business_id"
    t.string "offer_photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "small_businesses", force: :cascade do |t|
    t.string "small_business_name"
    t.text "small_business_description"
    t.string "small_business_location"
    t.integer "small_business_phone_number"
    t.string "small_business_photo"
    t.string "small_business_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.integer "company_id"
    t.boolean "company_admin_true_or_false"
    t.string "photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users_leveraging_accepted_offers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "accepted_offer_id"
    t.string "number_of_times_redeemed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
