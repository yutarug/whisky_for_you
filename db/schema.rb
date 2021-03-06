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

ActiveRecord::Schema.define(version: 2021_10_24_130442) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "bottles", force: :cascade do |t|
    t.integer "area_id", null: false
    t.integer "column_id"
    t.string "bottle_name", null: false
    t.integer "age"
    t.string "feature"
    t.string "image_id"
    t.text "introduction"
    t.string "japanese_bottle_name"
    t.integer "price_level", limit: 2, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "classification"
    t.string "distillery_name"
    t.integer "alcohol_content"
  end

  create_table "columns", force: :cascade do |t|
    t.string "title"
    t.text "introduction"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "bottle_id", null: false
    t.text "comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "bottle_id"
    t.integer "recommendation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bottle_id"], name: "index_relationships_on_bottle_id"
    t.index ["recommendation_id"], name: "index_relationships_on_recommendation_id"
  end

  create_table "tagmaps", force: :cascade do |t|
    t.integer "bottle_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tastes", force: :cascade do |t|
    t.integer "bottle_id"
    t.integer "peaty"
    t.integer "fruity"
    t.integer "floral"
    t.integer "feinty"
    t.integer "sulphury"
    t.integer "woody"
    t.integer "winey"
    t.integer "cereal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
