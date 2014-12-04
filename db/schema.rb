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

ActiveRecord::Schema.define(version: 20141204223329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: true do |t|
    t.string   "name",         null: false
    t.string   "email",        null: false
    t.string   "phone",        null: false
    t.string   "resume_url",   null: false
    t.integer  "recruiter_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "candidates", ["email"], name: "index_candidates_on_email", unique: true, using: :btree
  add_index "candidates", ["name"], name: "index_candidates_on_name", unique: true, using: :btree
  add_index "candidates", ["phone"], name: "index_candidates_on_phone", unique: true, using: :btree
  add_index "candidates", ["recruiter_id"], name: "index_candidates_on_recruiter_id", using: :btree
  add_index "candidates", ["resume_url"], name: "index_candidates_on_resume_url", unique: true, using: :btree

  create_table "steps", force: true do |t|
    t.text     "notes"
    t.integer  "candidate_id", null: false
    t.integer  "owner_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description",  null: false
  end

  add_index "steps", ["candidate_id"], name: "index_steps_on_candidate_id", using: :btree
  add_index "steps", ["owner_id"], name: "index_steps_on_owner_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "remember_token",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree

end
