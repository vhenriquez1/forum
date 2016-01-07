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

ActiveRecord::Schema.define(version: 20160104175546) do

  create_table "comments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "knowledge_base_articles", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "description"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "knowledge_base_categories", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "description"
    t.integer  "category_id"
    t.integer  "position",     default: 0
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "knowledge_base_categories", ["category_id"], name: "index_knowledge_base_categories_on_category_id"
  add_index "knowledge_base_categories", ["slug"], name: "index_knowledge_base_categories_on_slug", unique: true

  create_table "knowledge_base_category_article_associations", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "article_id"
    t.integer  "position",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "knowledge_base_category_article_associations", ["article_id"], name: "index_knowledge_base_c_a_association_on_article_id"
  add_index "knowledge_base_category_article_associations", ["category_id"], name: "index_knowledge_base_c_a_association_on_category_id"

  create_table "knowledge_base_sectionables_attachments_attachments", force: :cascade do |t|
    t.string  "title"
    t.string  "file"
    t.integer "attachment_list_id"
    t.text    "description"
  end

  add_index "knowledge_base_sectionables_attachments_attachments", ["attachment_list_id"], name: "index_knowledge_base_attachments_on_attachment_list_id"

  create_table "knowledge_base_sectionables_attachments_lists", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "style"
    t.string   "title"
  end

  create_table "knowledge_base_sectionables_galleries", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "style"
  end

  create_table "knowledge_base_sectionables_gallery_images", force: :cascade do |t|
    t.string   "caption"
    t.string   "image"
    t.integer  "position",   default: 0
    t.integer  "gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "knowledge_base_sectionables_gallery_images", ["gallery_id"], name: "index_knowledge_base_sectionables_gallery_images_on_gallery_id"

  create_table "knowledge_base_sectionables_images", force: :cascade do |t|
    t.text     "caption"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "style"
  end

  create_table "knowledge_base_sectionables_links_links", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "position",    default: 0
    t.integer  "links_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "knowledge_base_sectionables_links_lists", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "style"
  end

  create_table "knowledge_base_sectionables_list_items", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "position",   default: 0
    t.integer  "list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "knowledge_base_sectionables_list_items", ["list_id"], name: "index_knowledge_base_sectionables_list_items_on_list_id"

  create_table "knowledge_base_sectionables_lists", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "style"
  end

  create_table "knowledge_base_sectionables_texts", force: :cascade do |t|
    t.string   "heading"
    t.text     "lead"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "style"
  end

  create_table "knowledge_base_sectionables_videos", force: :cascade do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "style"
    t.string   "title"
  end

  create_table "knowledge_base_sections", force: :cascade do |t|
    t.integer  "sectionable_id"
    t.string   "sectionable_type"
    t.integer  "position",         default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "container_id"
    t.string   "container_type"
  end

  add_index "knowledge_base_sections", ["container_id", "container_type"], name: "index_knowledge_base_sections_on_container"
  add_index "knowledge_base_sections", ["sectionable_id", "sectionable_type"], name: "index_knowledge_base_sections_on_sectionable"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
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
