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

ActiveRecord::Schema.define(version: 20_201_029_183_938) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'cars', force: :cascade do |t|
    t.bigint 'maker_id'
    t.bigint 'model_id'
    t.integer 'year', null: false
    t.string 'color', null: false
    t.bigint 'subscription_id'
    t.datetime 'availability_date', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['maker_id'], name: 'index_cars_on_maker_id'
    t.index ['model_id'], name: 'index_cars_on_model_id'
    t.index ['subscription_id'], name: 'index_cars_on_subscription_id'
  end

  create_table 'makers', force: :cascade do |t|
    t.string 'name', null: false
  end

  create_table 'models', force: :cascade do |t|
    t.bigint 'maker_id'
    t.string 'name', null: false
    t.index ['maker_id'], name: 'index_models_on_maker_id'
  end

  create_table 'subscriptions', force: :cascade do |t|
    t.string 'name', null: false
    t.decimal 'price', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end
end
