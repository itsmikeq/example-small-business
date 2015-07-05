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

ActiveRecord::Schema.define(version: 20150118195814) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "state"
    t.integer  "zip_code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "city"
    t.integer  "customer_id"
    t.string   "location"
  end

  add_index "addresses", ["customer_id"], name: "index_addresses_on_customer_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "email_id"
    t.integer  "address_id"
  end

  add_index "customers", ["address_id"], name: "index_customers_on_address_id", using: :btree
  add_index "customers", ["email_id"], name: "index_customers_on_email_id", using: :btree

  create_table "emails", force: :cascade do |t|
    t.string   "address"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "primary"
  end

  add_index "emails", ["customer_id"], name: "index_emails_on_customer_id", using: :btree

  create_table "endorsements", force: :cascade do |t|
    t.text     "endorsement"
    t.integer  "customer_id"
    t.boolean  "approved"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "endorsements", ["customer_id"], name: "index_endorsements_on_customer_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "phones", force: :cascade do |t|
    t.string   "number"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "primary"
  end

  add_index "phones", ["customer_id"], name: "index_phones_on_customer_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content_md"
    t.text     "content_html"
    t.boolean  "draft",        default: false
    t.integer  "user_id"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "admin",                  default: false, null: false
    t.boolean  "locked",                 default: false, null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "contactable"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "addresses", "customers"
  add_foreign_key "customers", "addresses"
  add_foreign_key "customers", "emails"
  add_foreign_key "emails", "customers"
  add_foreign_key "endorsements", "customers"
  add_foreign_key "phones", "customers"
end
