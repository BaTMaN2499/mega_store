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

ActiveRecord::Schema.define(version: 20180725044728) do

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "base_price"
    t.integer "stock"
    t.integer "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_products_on_store_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "amount"
    t.integer "product_id"
    t.integer "customer_id"
    t.integer "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_purchases_on_customer_id"
    t.index ["product_id"], name: "index_purchases_on_product_id"
    t.index ["store_id"], name: "index_purchases_on_store_id"
  end

  create_table "shippings", force: :cascade do |t|
    t.string "address"
    t.string "status"
    t.integer "purchase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_id"], name: "index_shippings_on_purchase_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
