# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_03_144823) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "home_stays", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.text "description"
    t.integer "no_of_rooms"
    t.integer "rating"
    t.integer "price"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_home_stays_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.text "url"
    t.bigint "home_stay_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_stay_id"], name: "index_images_on_home_stay_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "no_of_persons"
    t.date "start_date"
    t.date "end_date"
    t.bigint "user_id", null: false
    t.bigint "home_stay_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_stay_id"], name: "index_reservations_on_home_stay_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "home_stays", "users"
  add_foreign_key "images", "home_stays"
  add_foreign_key "reservations", "home_stays"
  add_foreign_key "reservations", "users"
end
