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

ActiveRecord::Schema.define(version: 20151028111928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "body"
    t.integer  "person_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["person_id"], name: "index_comments_on_person_id", using: :btree
  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree

  create_table "follows", force: :cascade do |t|
    t.string   "follower_type"
    t.integer  "follower_id"
    t.string   "followable_type"
    t.integer  "followable_id"
    t.datetime "created_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables", using: :btree
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows", using: :btree

  create_table "likes", force: :cascade do |t|
    t.string   "liker_type"
    t.integer  "liker_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at"
  end

  add_index "likes", ["likeable_id", "likeable_type"], name: "fk_likeables", using: :btree
  add_index "likes", ["liker_id", "liker_type"], name: "fk_likes", using: :btree

  create_table "mentions", force: :cascade do |t|
    t.string   "mentioner_type"
    t.integer  "mentioner_id"
    t.string   "mentionable_type"
    t.integer  "mentionable_id"
    t.datetime "created_at"
  end

  add_index "mentions", ["mentionable_id", "mentionable_type"], name: "fk_mentionables", using: :btree
  add_index "mentions", ["mentioner_id", "mentioner_type"], name: "fk_mentions", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "title"
    t.text     "address"
    t.string   "mobile"
    t.string   "fax"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "attachment"
    t.integer  "union_id"
    t.string   "gender"
    t.boolean  "volunteer",              default: true
  end

  add_index "people", ["email"], name: "index_people_on_email", unique: true, using: :btree
  add_index "people", ["invitation_token"], name: "index_people_on_invitation_token", unique: true, using: :btree
  add_index "people", ["invitations_count"], name: "index_people_on_invitations_count", using: :btree
  add_index "people", ["invited_by_id"], name: "index_people_on_invited_by_id", using: :btree
  add_index "people", ["reset_password_token"], name: "index_people_on_reset_password_token", unique: true, using: :btree
  add_index "people", ["union_id"], name: "index_people_on_union_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.text     "body"
    t.string   "attachment"
    t.integer  "person_id"
    t.integer  "parent_id"
    t.string   "parent_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "posts", ["parent_id"], name: "index_posts_on_parent_id", using: :btree
  add_index "posts", ["parent_type", "parent_id"], name: "index_posts_on_parent_type_and_parent_id", using: :btree
  add_index "posts", ["person_id"], name: "index_posts_on_person_id", using: :btree

  create_table "recs", force: :cascade do |t|
    t.string   "name"
    t.string   "tags"
    t.string   "attachment"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "company_id"
    t.integer  "union_id"
    t.integer  "person_id"
    t.integer  "followers_count",            default: 0
    t.string   "nature_of_employment"
    t.boolean  "financially_stable"
    t.boolean  "accommodation_secure"
    t.boolean  "primary_carer"
    t.boolean  "community_life"
    t.boolean  "is_union"
    t.text     "host_employer"
    t.string   "location"
    t.string   "industry"
    t.text     "solution"
    t.string   "publish"
    t.boolean  "entitlements"
    t.string   "when"
    t.boolean  "predictable_hours"
    t.boolean  "compliant_employment"
    t.boolean  "paid_fairly"
    t.boolean  "safe_work"
    t.boolean  "could_speak_up"
    t.text     "could_speak_up_comment"
    t.string   "supermarket_supply"
    t.string   "string"
    t.string   "summary"
    t.string   "company_name"
    t.text     "pay_and_conditions_comment"
    t.boolean  "safe_work_explained"
    t.boolean  "hsr_explained"
    t.text     "health_and_safety_comment"
    t.text     "personal_impact_comment"
    t.boolean  "feeling_secure"
    t.text     "financial_security_comment"
    t.boolean  "options"
    t.text     "feeling_trapped_comment"
    t.string   "youtube"
    t.boolean  "facebooked"
    t.boolean  "tweeted"
    t.string   "token"
    t.boolean  "volunteer"
    t.string   "volunteer_comment"
    t.boolean  "is_anonymous",               default: false
    t.boolean  "enabled",                    default: true
  end

  add_index "recs", ["company_id"], name: "index_recs_on_company_id", using: :btree
  add_index "recs", ["person_id"], name: "index_recs_on_person_id", using: :btree
  add_index "recs", ["union_id"], name: "index_recs_on_union_id", using: :btree

  create_table "supergroups", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.string   "www"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "banner"
    t.string   "logo"
    t.string   "short_name"
    t.integer  "followers_count",     default: 0
    t.string   "call_to_action"
    t.text     "explanation"
    t.string   "submissions_heading"
    t.string   "background_colour"
    t.string   "font_colour"
    t.string   "action1"
    t.boolean  "enabled",             default: false
    t.text     "union_rep_quote"
    t.string   "union_rep"
    t.string   "union_rep_cite"
  end

  add_foreign_key "comments", "people"
  add_foreign_key "comments", "posts"
  add_foreign_key "people", "supergroups", column: "union_id"
  add_foreign_key "posts", "people"
  add_foreign_key "recs", "people"
  add_foreign_key "recs", "supergroups", column: "company_id"
  add_foreign_key "recs", "supergroups", column: "union_id"
end
