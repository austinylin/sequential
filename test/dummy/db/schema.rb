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

ActiveRecord::Schema.define(version: 20131104020142) do

  create_table "comments", force: true do |t|
    t.string   "title"
    t.integer  "absolute_number"
    t.integer  "sequential_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", force: true do |t|
    t.integer "client_id"
    t.integer "sequential_id"
  end

  create_table "posts", force: true do |t|
    t.integer "author_id"
    t.integer "sequential_id"
  end

  create_table "products", force: true do |t|
    t.integer  "price"
    t.integer  "sequential_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seq_id_sequences", force: true do |t|
    t.string   "model"
    t.string   "scope"
    t.string   "column"
    t.integer  "scope_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", force: true do |t|
    t.string   "title"
    t.integer  "story_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
