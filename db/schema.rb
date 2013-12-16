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

ActiveRecord::Schema.define(version: 20131212214552) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", unique: true
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "topic"
    t.string   "meta_title"
    t.text     "meta_description"
    t.string   "meta_keywords"
  end

  add_index "posts", ["slug"], name: "index_posts_on_slug", unique: true

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.string   "customer"
    t.text     "description"
    t.string   "feature_image"
    t.string   "tech"
    t.string   "duration"
    t.text     "features"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "site_link"
    t.string   "slug"
    t.string   "meta_title"
    t.text     "meta_description"
    t.string   "meta_keywords"
  end

  add_index "projects", ["slug"], name: "index_projects_on_slug", unique: true

  create_table "recipes", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "instructions"
    t.text     "ingredients"
    t.string   "image"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "prep"
    t.string   "cooking"
    t.string   "serves"
    t.text     "tips"
    t.text     "additional_info"
    t.string   "level"
    t.string   "meta_title"
    t.text     "meta_description"
    t.string   "meta_keywords"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "todos", force: true do |t|
    t.string   "name"
    t.string   "kind"
    t.string   "location"
    t.string   "status"
    t.date     "due"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
