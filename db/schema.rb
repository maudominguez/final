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

ActiveRecord::Schema.define(version: 0) do

  create_table "authors", force: :cascade do |t|
    t.text   "name"
    t.string "image_url"
  end

  create_table "books", force: :cascade do |t|
    t.string  "title"
    t.text    "description"
    t.string  "image_url"
    t.integer "year"
    t.integer "genre_id"
  end

  add_index "books", ["genre_id"], name: "index_books_on_genre_id"

  create_table "genres", force: :cascade do |t|
    t.text   "description"
    t.string "name"
  end

  create_table "reviews", force: :cascade do |t|
    t.text    "comment"
    t.integer "book_id"
    t.integer "user_id"
    t.integer "rating"
  end

  add_index "reviews", ["book_id"], name: "index_reviews_on_book_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "roles", force: :cascade do |t|
    t.integer "author_id"
    t.integer "book_id"
  end

  add_index "roles", ["author_id"], name: "index_roles_on_author_id"
  add_index "roles", ["book_id"], name: "index_roles_on_book_id"

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.string  "email"
    t.text    "password_digest"
    t.boolean "admin",           default: false
  end

end
