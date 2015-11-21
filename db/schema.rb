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

ActiveRecord::Schema.define(version: 20151019003346) do

  create_table "companies", force: :cascade do |t|
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "name",                   limit: 255
    t.string   "cnpj",                   limit: 255
    t.string   "phone",                  limit: 255
    t.string   "andress",                limit: 255
    t.string   "access_token",           limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "companies", ["access_token"], name: "index_companies_on_access_token", using: :btree
  add_index "companies", ["andress"], name: "index_companies_on_andress", using: :btree
  add_index "companies", ["cnpj"], name: "index_companies_on_cnpj", using: :btree
  add_index "companies", ["email"], name: "index_companies_on_email", unique: true, using: :btree
  add_index "companies", ["name"], name: "index_companies_on_name", using: :btree
  add_index "companies", ["phone"], name: "index_companies_on_phone", using: :btree
  add_index "companies", ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true, using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.date     "post_date"
    t.integer  "point",      limit: 4
    t.text     "message",    limit: 65535
    t.integer  "trip_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "posts", ["trip_id"], name: "index_posts_on_trip_id", using: :btree

  create_table "trips", force: :cascade do |t|
    t.string   "category",            limit: 255
    t.string   "name",                limit: 255
    t.string   "origin",              limit: 255
    t.string   "destination",         limit: 255
    t.float    "price",               limit: 24
    t.date     "in_date"
    t.date     "out_date"
    t.text     "description",         limit: 65535
    t.integer  "company_id",          limit: 4
    t.integer  "user_id",             limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "trips", ["company_id"], name: "index_trips_on_company_id", using: :btree
  add_index "trips", ["user_id"], name: "index_trips_on_user_id", using: :btree

  create_table "user_requests", force: :cascade do |t|
    t.string   "user_name",     limit: 255
    t.string   "user_phone",    limit: 255
    t.string   "user_email",    limit: 255
    t.datetime "trip_out_date"
    t.string   "status",        limit: 255
    t.text     "user_message",  limit: 65535
    t.integer  "trip_id",       limit: 4
    t.integer  "user_id",       limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "user_requests", ["trip_id"], name: "index_user_requests_on_trip_id", using: :btree
  add_index "user_requests", ["user_id"], name: "index_user_requests_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
    t.string   "email",                  limit: 255
    t.string   "cpf",                    limit: 255
    t.string   "phone",                  limit: 255
    t.string   "andress",                limit: 255
    t.string   "access_token",           limit: 255
    t.string   "photo_url",              limit: 255
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "user_name",              limit: 255
    t.string   "oauth_token",            limit: 255
    t.string   "token_secret",           limit: 255
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
  end

  add_index "users", ["access_token"], name: "index_users_on_access_token", using: :btree
  add_index "users", ["andress"], name: "index_users_on_andress", using: :btree
  add_index "users", ["cpf"], name: "index_users_on_cpf", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["oauth_token"], name: "index_users_on_oauth_token", using: :btree
  add_index "users", ["phone"], name: "index_users_on_phone", using: :btree
  add_index "users", ["photo_url"], name: "index_users_on_photo_url", using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["token_secret"], name: "index_users_on_token_secret", using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree
  add_index "users", ["user_name"], name: "index_users_on_user_name", using: :btree

end
