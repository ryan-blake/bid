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

ActiveRecord::Schema.define(version: 20160210220455) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.integer  "client_id"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "role"
  end

  add_index "clients", ["email"], name: "index_clients_on_email", unique: true
  add_index "clients", ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "job_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "laborer_id"
    t.integer  "client_id"
    t.integer  "category_id"
    t.integer  "price"
  end

  add_index "jobs", ["category_id"], name: "index_jobs_on_category_id"
  add_index "jobs", ["client_id"], name: "index_jobs_on_client_id"
  add_index "jobs", ["laborer_id"], name: "index_jobs_on_laborer_id"

  create_table "laborers", force: :cascade do |t|
    t.string   "name"
    t.string   "about"
    t.integer  "laborer_id"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "role"
    t.integer  "job_id"
  end

  add_index "laborers", ["email"], name: "index_laborers_on_email", unique: true
  add_index "laborers", ["job_id"], name: "index_laborers_on_job_id"
  add_index "laborers", ["reset_password_token"], name: "index_laborers_on_reset_password_token", unique: true

  create_table "submits", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "laborer_id_id"
    t.integer  "price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "submits", ["job_id"], name: "index_submits_on_job_id"
  add_index "submits", ["laborer_id_id"], name: "index_submits_on_laborer_id_id"

  create_table "submittings", force: :cascade do |t|
    t.integer  "submit_id"
    t.integer  "submittable_id"
    t.string   "submittable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "submittings", ["submit_id"], name: "index_submittings_on_submit_id"
  add_index "submittings", ["submittable_type", "submittable_id"], name: "index_submittings_on_submittable_type_and_submittable_id"

end
