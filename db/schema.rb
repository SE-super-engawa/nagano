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

ActiveRecord::Schema.define(version: 20210106073051) do

  create_table "customers", force: :cascade do |t|
    t.string   "family_name"
    t.string   "first_name"
    t.string   "family_name_kana"
    t.string   "first_name_kana"
    t.string   "email"
    t.string   "password"
    t.string   "postal_code"
    t.string   "address"
    t.string   "phone_number"
    t.boolean  "is_deleted"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "image_id"
    t.text     "description"
    t.integer  "price"
    t.boolean  "is_active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.string   "postal_code"
    t.string   "address"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end
  
  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.boolean  "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_products", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "price"
    t.integer  "quantity"
    t.integer  "making_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "postal_code"
    t.string   "address"
    t.string   "name"
    t.integer  "shipping_fee"
    t.integer  "total_price"
    t.integer  "payment"
    t.integer  "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
