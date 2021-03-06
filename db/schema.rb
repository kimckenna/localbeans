# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_03_104510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "address_line1"
    t.string "address_line2"
    t.string "suburb"
    t.integer "state"
    t.integer "postcode"
    t.bigint "stockist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stockist_id"], name: "index_addresses_on_stockist_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "brand"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "grinds", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "bean_grind"
  end

  create_table "listing_grinds", force: :cascade do |t|
    t.bigint "grind_id", null: false
    t.bigint "listing_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["grind_id"], name: "index_listing_grinds_on_grind_id"
    t.index ["listing_id"], name: "index_listing_grinds_on_listing_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "name"
    t.string "origin"
    t.text "flavour_profile"
    t.integer "bean_type"
    t.bigint "stockist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.string "roast"
    t.bigint "brand_id", null: false
    t.index ["brand_id"], name: "index_listings_on_brand_id"
    t.index ["stockist_id"], name: "index_listings_on_stockist_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "total_price", precision: 8, scale: 2
    t.bigint "size_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "grind_id", null: false
    t.index ["grind_id"], name: "index_reservations_on_grind_id"
    t.index ["size_id"], name: "index_reservations_on_size_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.integer "size"
    t.decimal "price", precision: 8, scale: 2
    t.boolean "active"
    t.bigint "listing_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["listing_id"], name: "index_sizes_on_listing_id"
  end

  create_table "stockist_brands", force: :cascade do |t|
    t.bigint "brand_id", null: false
    t.bigint "stockist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_stockist_brands_on_brand_id"
    t.index ["stockist_id"], name: "index_stockist_brands_on_stockist_id"
  end

  create_table "stockists", force: :cascade do |t|
    t.string "business_name"
    t.bigint "abn"
    t.boolean "verified"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_stockists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "stockists"
  add_foreign_key "listing_grinds", "grinds"
  add_foreign_key "listing_grinds", "listings"
  add_foreign_key "listings", "brands"
  add_foreign_key "listings", "stockists"
  add_foreign_key "reservations", "grinds"
  add_foreign_key "reservations", "sizes"
  add_foreign_key "reservations", "users"
  add_foreign_key "sizes", "listings"
  add_foreign_key "stockist_brands", "brands"
  add_foreign_key "stockist_brands", "stockists"
  add_foreign_key "stockists", "users"
end
