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

ActiveRecord::Schema.define(version: 2019_07_08_105451) do

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "rhetoric_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "picks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "rhetoric_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rhetoric_id"], name: "index_picks_on_rhetoric_id"
    t.index ["user_id", "rhetoric_id"], name: "index_picks_on_user_id_and_rhetoric_id", unique: true
    t.index ["user_id"], name: "index_picks_on_user_id"
  end

  create_table "rhetorics", force: :cascade do |t|
    t.text "meigen"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "ctype"
    t.binary "image"
    t.integer "picks_count", default: 0, null: false
    t.index ["user_id"], name: "index_rhetorics_on_user_id"
  end

  create_table "sources", force: :cascade do |t|
    t.text "name"
    t.integer "rhetoric_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rhetoric_id"], name: "index_sources_on_rhetoric_id"
  end

  create_table "speakers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rhetoric_id"
    t.index ["rhetoric_id"], name: "index_speakers_on_rhetoric_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.string "provider"
    t.string "username"
    t.text "profile"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
