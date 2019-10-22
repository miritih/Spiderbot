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

ActiveRecord::Schema.define(version: 2019_10_22_181238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employers", force: :cascade do |t|
    t.string "name", null: false
    t.string "location", null: false
    t.string "employer_type"
    t.string "sector"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "import_configs", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.json "seed_click"
    t.json "first_page"
    t.json "second_page"
    t.json "next_page"
    t.integer "job_count"
    t.string "jobs_page_url"
    t.string "home_page"
    t.string "employer_override", default: "null"
    t.string "location_override", default: "null"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "job_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "id_from_source"
    t.string "job_city"
    t.string "job_category"
    t.string "job_compensation"
    t.string "expire_date"
    t.string "job_employer"
    t.string "job_listing_url"
    t.string "job_location"
    t.string "apply_to_email"
    t.text "job_description"
    t.string "job_source_ad_target"
    t.string "job_state"
    t.string "job_country"
    t.string "job_date"
    t.string "postal_code"
    t.string "job_title"

  end

end
