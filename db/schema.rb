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

ActiveRecord::Schema.define(version: 2019_10_21_202558) do

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
    t.string "title"
    t.string "location"
    t.text "description"
    t.string "job_type"
    t.string "link"
    t.string "department"
    t.string "apply_link"
    t.string "apply_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "employer_id"
  end

end
