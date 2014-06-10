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

ActiveRecord::Schema.define(version: 20140610022602) do

  create_table "activities", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "lecture_id"
    t.integer  "extra_id"
    t.integer  "tech_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["course_id"], name: "index_activities_on_course_id"
  add_index "activities", ["extra_id"], name: "index_activities_on_extra_id"
  add_index "activities", ["lecture_id"], name: "index_activities_on_lecture_id"
  add_index "activities", ["tech_id"], name: "index_activities_on_tech_id"
  add_index "activities", ["user_id"], name: "index_activities_on_user_id"

  create_table "courses", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "time"
    t.integer  "day"
    t.integer  "limit"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "extras", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "limit"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lectures", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "time"
    t.integer  "day"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teches", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "day"
    t.string   "time"
    t.integer  "limit"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "age"
    t.integer  "serial"
    t.string   "password"
    t.string   "email"
    t.string   "phone"
    t.string   "course"
    t.string   "facebook"
    t.boolean  "has_paid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
