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

ActiveRecord::Schema.define(version: 20150612183227) do

  create_table "courses", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_users", force: true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.string   "title"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "course_id"
    t.date     "start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "scorecard_id"
  end

  create_table "scorecard_templates", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.string   "tee"
    t.integer  "holes"
    t.integer  "slope"
    t.decimal  "rating",     precision: 10, scale: 1
    t.string   "pars"
    t.string   "yards"
    t.string   "handicaps"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", force: true do |t|
    t.integer  "user_id"
    t.integer  "golfer_id"
    t.integer  "event_id"
    t.integer  "round_id"
    t.integer  "course_id"
    t.integer  "teetime_id"
    t.integer  "hole"
    t.integer  "par"
    t.integer  "yards"
    t.integer  "handicap"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teetimes", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "course_id"
    t.integer  "round_id"
    t.integer  "golfer_id"
    t.datetime "teetime"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "manual",     default: false
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "access",          limit: 3
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_active",               default: '2015-06-12 18:34:25'
    t.integer  "login_count",               default: 0
  end

end
