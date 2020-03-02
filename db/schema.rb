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

ActiveRecord::Schema.define(version: 2020_03_02_145259) do

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pizza_ingredients", force: :cascade do |t|
    t.integer "pizza_model_id", null: false
    t.integer "ingredient_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ingredient_id"], name: "index_pizza_ingredients_on_ingredient_id"
    t.index ["pizza_model_id"], name: "index_pizza_ingredients_on_pizza_model_id"
  end

  create_table "pizza_models", force: :cascade do |t|
    t.decimal "cost", precision: 5, scale: 2
    t.integer "size_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["size_id"], name: "index_pizza_models_on_size_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "pizza_ingredients", "ingredients"
  add_foreign_key "pizza_ingredients", "pizza_models"
  add_foreign_key "pizza_models", "sizes"
end
