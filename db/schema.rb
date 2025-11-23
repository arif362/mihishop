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

ActiveRecord::Schema[8.1].define(version: 2025_11_23_015311) do
  create_table "addresses", charset: "utf8mb3", force: :cascade do |t|
    t.string "address"
    t.string "city"
    t.string "company"
    t.string "country"
    t.datetime "created_at", null: false
    t.string "firstname"
    t.string "lastname"
    t.string "phone"
    t.string "state"
    t.datetime "updated_at", null: false
    t.string "zipcode"
  end

  create_table "admin_brands", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.boolean "is_active", default: true
    t.string "keywords"
    t.string "meta_desc"
    t.string "meta_title"
    t.string "name"
    t.string "permalink"
    t.string "slug"
    t.datetime "updated_at", null: false
  end

  create_table "admin_categories", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "description"
    t.string "keywords"
    t.string "meta_desc"
    t.string "meta_title"
    t.string "name"
    t.integer "parent_id"
    t.string "permalink"
    t.string "slug"
    t.datetime "updated_at", null: false
  end

  create_table "blogs", charset: "utf8mb3", force: :cascade do |t|
    t.text "body"
    t.string "cover_photo"
    t.datetime "created_at", null: false
    t.string "slug"
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "comments", charset: "utf8mb3", force: :cascade do |t|
    t.integer "blog_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.boolean "is_approved"
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "contacts", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "full_name"
    t.string "inquiry_type"
    t.text "message"
    t.string "order_number"
    t.string "phone"
    t.datetime "updated_at", null: false
  end

  create_table "customer_returns", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "number"
    t.integer "order_id"
    t.integer "stock_location_id"
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "customer_service"
    t.string "email"
    t.string "feedback_type"
    t.text "message"
    t.string "name"
    t.string "product_price"
    t.string "product_quality"
    t.integer "rate"
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at"
    t.string "scope"
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "home_sliders", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "image"
    t.string "link"
    t.string "sub_title"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "images", charset: "utf8mb3", force: :cascade do |t|
    t.string "alt"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.text "file"
    t.integer "file_size"
    t.integer "height"
    t.integer "position"
    t.datetime "updated_at", null: false
    t.bigint "viewable_id"
    t.string "viewable_type"
    t.integer "width"
    t.index ["viewable_type", "viewable_id"], name: "index_images_on_viewable_type_and_viewable_id"
  end

  create_table "line_items", charset: "utf8mb3", force: :cascade do |t|
    t.decimal "adjustment_total", precision: 10, default: "0"
    t.float "cost_price", default: 0.0
    t.datetime "created_at", null: false
    t.string "currency"
    t.integer "order_id"
    t.float "price", default: 0.0
    t.decimal "promo_total", precision: 10, default: "0"
    t.integer "quantity"
    t.string "size"
    t.datetime "updated_at", null: false
    t.integer "variant_id"
  end

  create_table "newsletter_subscriptions", charset: "utf8mb3", force: :cascade do |t|
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.string "email"
    t.datetime "updated_at", null: false
  end

  create_table "orders", charset: "utf8mb3", force: :cascade do |t|
    t.decimal "adjustment_total", precision: 10, default: "0"
    t.datetime "approved_at"
    t.integer "approver_id"
    t.datetime "canceled_at"
    t.integer "canceler_id"
    t.string "collection_point"
    t.datetime "completed_at"
    t.boolean "confirmation_delivered"
    t.datetime "created_at", null: false
    t.string "created_by_id"
    t.string "currency"
    t.string "email"
    t.string "guest_token"
    t.integer "item_count"
    t.decimal "item_total", precision: 10, default: "0"
    t.string "number"
    t.string "payment_state"
    t.decimal "payment_total", precision: 10, default: "0"
    t.decimal "promo_total", precision: 10, default: "0"
    t.integer "ship_address_id"
    t.date "shipment_date"
    t.integer "shipment_progress", default: 0
    t.string "shipment_state"
    t.decimal "shipment_total", precision: 10, default: "0"
    t.datetime "shipped_at"
    t.text "special_instructions"
    t.string "state"
    t.integer "store_id"
    t.decimal "tax_total", precision: 10, default: "0"
    t.decimal "total", precision: 10, default: "0"
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "payment_methods", charset: "utf8mb3", force: :cascade do |t|
    t.boolean "active"
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name"
    t.text "preferences"
    t.string "type"
    t.datetime "updated_at", null: false
  end

  create_table "payments", charset: "utf8mb3", force: :cascade do |t|
    t.decimal "amount", precision: 10
    t.datetime "created_at", null: false
    t.string "number"
    t.integer "order_id"
    t.integer "payment_method_id"
    t.string "response_code"
    t.string "response_message"
    t.integer "source_id"
    t.string "source_type"
    t.string "state"
    t.datetime "updated_at", null: false
  end

  create_table "paypal_express_checkouts", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "order_id"
    t.string "payer_id"
    t.integer "refund_id"
    t.string "refund_type"
    t.datetime "refunded_at"
    t.string "state", default: "completed"
    t.string "token"
    t.datetime "updated_at", null: false
  end

  create_table "product_categories", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.bigint "product_id"
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_product_categories_on_category_id"
    t.index ["product_id"], name: "index_product_categories_on_product_id"
  end

  create_table "products", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "brand_id"
    t.string "code", null: false
    t.string "color"
    t.string "color_name"
    t.float "cost_price", limit: 53, default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.string "depth"
    t.text "description"
    t.float "discount", limit: 53, default: 0.0, null: false
    t.boolean "discountable", default: false
    t.string "height"
    t.boolean "is_active", default: true, null: false
    t.boolean "is_amount", default: false
    t.boolean "is_featured", default: false, null: false
    t.string "keywords"
    t.text "meta_desc"
    t.string "meta_title"
    t.string "name"
    t.string "origin"
    t.integer "product_id"
    t.float "reward_point", limit: 53, default: 0.0, null: false
    t.float "sale_price", limit: 53, default: 0.0, null: false
    t.string "size"
    t.string "slug"
    t.boolean "track_inventory", default: true
    t.datetime "updated_at", null: false
    t.string "weight"
    t.float "whole_sale", limit: 53, default: 0.0, null: false
    t.string "width"
    t.index ["brand_id"], name: "index_products_on_brand_id"
  end

  create_table "refunds", charset: "utf8mb3", force: :cascade do |t|
    t.decimal "amount", precision: 10
    t.datetime "created_at", null: false
    t.integer "payment_id"
    t.string "reason"
    t.datetime "updated_at", null: false
  end

  create_table "related_products", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "product_id"
    t.integer "relative_id"
    t.datetime "updated_at", null: false
  end

  create_table "return_items", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "customer_return_id"
    t.integer "line_item_id"
    t.boolean "resellable"
    t.datetime "updated_at", null: false
  end

  create_table "reviews", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.boolean "is_approved", default: false
    t.string "name"
    t.integer "product_id"
    t.integer "rating"
    t.text "text"
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "rewards_points", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "order_id"
    t.float "points", default: 0.0
    t.string "reason"
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "shipments", charset: "utf8mb3", force: :cascade do |t|
    t.integer "address_id"
    t.decimal "adjustment_total", precision: 10, default: "0"
    t.decimal "cost", precision: 10, default: "0"
    t.datetime "created_at", null: false
    t.string "number"
    t.integer "order_id"
    t.decimal "promo_total", precision: 10, default: "0"
    t.datetime "shipped_at"
    t.integer "shipping_method_id"
    t.string "state"
    t.integer "stock_location_id"
    t.string "tracking"
    t.datetime "updated_at", null: false
  end

  create_table "shipping_methods", charset: "utf8mb3", force: :cascade do |t|
    t.string "admin_name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.string "display_on"
    t.string "name"
    t.string "rate"
    t.string "tracking_url"
    t.datetime "updated_at", null: false
  end

  create_table "stock_items", charset: "utf8mb3", force: :cascade do |t|
    t.boolean "backorderable", default: false
    t.integer "count_on_hand", default: 0
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.integer "product_id"
    t.integer "stock_location_id"
    t.datetime "updated_at", null: false
  end

  create_table "stock_locations", charset: "utf8mb3", force: :cascade do |t|
    t.boolean "active", default: true
    t.string "address"
    t.string "admin_name"
    t.boolean "backorderable_default", default: false
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.boolean "default", default: false
    t.string "name"
    t.string "phone"
    t.boolean "propagate_all_variants", default: true
    t.string "state"
    t.datetime "updated_at", null: false
    t.string "zipcode"
  end

  create_table "stock_movements", charset: "utf8mb3", force: :cascade do |t|
    t.string "action"
    t.datetime "created_at", null: false
    t.integer "originator_id"
    t.string "originator_type"
    t.integer "quantity", default: 0
    t.integer "stock_item_id"
    t.datetime "updated_at", null: false
  end

  create_table "stock_transfers", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "destination_location_id"
    t.string "number"
    t.string "reference"
    t.integer "source_location_id"
    t.string "transfer_type"
    t.datetime "updated_at", null: false
  end

  create_table "trackings", charset: "utf8mb3", force: :cascade do |t|
    t.text "comment"
    t.datetime "created_at", null: false
    t.integer "shipment_id"
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "current_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "last_sign_in_at"
    t.string "last_sign_in_ip"
    t.string "name"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.string "role"
    t.integer "ship_address_id"
    t.integer "sign_in_count", default: 0, null: false
    t.text "tokens"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wishlists", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "product_id"
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end
end
