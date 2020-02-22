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

ActiveRecord::Schema.define(version: 2020_02_22_180112) do

  create_table "accounts", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "currency_id"
    t.string "account_type", null: false
    t.decimal "balance", precision: 30, scale: 10, null: false
    t.string "number", null: false
    t.string "status", default: "draft", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_accounts_on_currency_id"
    t.index ["customer_id"], name: "index_accounts_on_customer_id"
    t.index ["number"], name: "index_accounts_on_number", unique: true
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "rate", precision: 20, scale: 10, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "phone", null: false
    t.string "email", null: false
    t.string "status", default: "draft", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["phone"], name: "index_customers_on_phone", unique: true
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "to_customer_id"
    t.integer "to_account_id"
    t.integer "from_customer_id"
    t.integer "from_account_id"
    t.decimal "amount", precision: 30, scale: 10, null: false
    t.string "transaction_type", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_account_id"], name: "index_transactions_on_from_account_id"
    t.index ["from_customer_id"], name: "index_transactions_on_from_customer_id"
    t.index ["to_account_id"], name: "index_transactions_on_to_account_id"
    t.index ["to_customer_id"], name: "index_transactions_on_to_customer_id"
  end

end
