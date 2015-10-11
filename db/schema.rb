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

ActiveRecord::Schema.define(version: 20151011231818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "people", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "title"
    t.text     "address"
    t.string   "mobile"
    t.string   "fax"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "people", ["email"], name: "index_people_on_email", unique: true, using: :btree
  add_index "people", ["invitation_token"], name: "index_people_on_invitation_token", unique: true, using: :btree
  add_index "people", ["invitations_count"], name: "index_people_on_invitations_count", using: :btree
  add_index "people", ["invited_by_id"], name: "index_people_on_invited_by_id", using: :btree
  add_index "people", ["reset_password_token"], name: "index_people_on_reset_password_token", unique: true, using: :btree

  create_table "recs", force: :cascade do |t|
    t.string   "name"
    t.string   "tags"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "attachment"
    t.string   "coverage"
    t.string   "product_service"
    t.string   "union"
    t.string   "company"
    t.string   "local_union_contact"
    t.string   "national_union_contact"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "company_id"
    t.integer  "union_id"
    t.integer  "person_id"
  end

  add_index "recs", ["company_id"], name: "index_recs_on_company_id", using: :btree
  add_index "recs", ["person_id"], name: "index_recs_on_person_id", using: :btree
  add_index "recs", ["union_id"], name: "index_recs_on_union_id", using: :btree

  create_table "supergroups", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.string   "www"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "recs", "people"
  add_foreign_key "recs", "supergroups", column: "company_id"
  add_foreign_key "recs", "supergroups", column: "union_id"
end
