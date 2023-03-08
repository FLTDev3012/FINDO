# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_08_145150) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gifts", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.string "description"
    t.float "rating"
    t.string "url"
    t.integer "vote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gifts_tags", force: :cascade do |t|
    t.bigint "gift_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gift_id"], name: "index_gifts_tags_on_gift_id"
    t.index ["tag_id"], name: "index_gifts_tags_on_tag_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "description"
    t.bigint "user_id", null: false
    t.bigint "gift_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gift_id"], name: "index_reviews_on_gift_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "wishlists_gift_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_votes_on_user_id"
    t.index ["wishlists_gift_id"], name: "index_votes_on_wishlists_gift_id"
  end

  create_table "wishlists", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

  create_table "wishlists_gifts", force: :cascade do |t|
    t.integer "vote"
    t.bigint "gift_id", null: false
    t.bigint "wishlist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gift_id"], name: "index_wishlists_gifts_on_gift_id"
    t.index ["wishlist_id"], name: "index_wishlists_gifts_on_wishlist_id"
  end

  create_table "wishlists_tags", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "wishlist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_wishlists_tags_on_tag_id"
    t.index ["wishlist_id"], name: "index_wishlists_tags_on_wishlist_id"
  end

  add_foreign_key "gifts_tags", "gifts"
  add_foreign_key "gifts_tags", "tags"
  add_foreign_key "reviews", "gifts"
  add_foreign_key "reviews", "users"
  add_foreign_key "votes", "users"
  add_foreign_key "votes", "wishlists_gifts"
  add_foreign_key "wishlists", "users"
  add_foreign_key "wishlists_gifts", "gifts"
  add_foreign_key "wishlists_gifts", "wishlists"
  add_foreign_key "wishlists_tags", "tags"
  add_foreign_key "wishlists_tags", "wishlists"
end
