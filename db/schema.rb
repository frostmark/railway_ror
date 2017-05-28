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

ActiveRecord::Schema.define(version: 20170528113843) do

  create_table "carriages", force: :cascade do |t|
    t.integer "top_seats", default: 0
    t.integer "low_seats", default: 0
    t.integer "train_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.integer "side_top_seats", default: 0
    t.integer "side_low_seats", default: 0
    t.integer "sedentary_seats", default: 0
    t.index ["train_id"], name: "index_carriages_on_train_id"
  end

  create_table "railway_stations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes_stations", force: :cascade do |t|
    t.integer "route_id"
    t.integer "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_routes_stations_on_route_id"
    t.index ["station_id"], name: "index_routes_stations_on_station_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "train_id"
    t.integer "user_id"
    t.integer "start_station_id"
    t.integer "end_station_id"
    t.integer "route_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["end_station_id"], name: "index_tickets_on_end_station_id"
    t.index ["route_id"], name: "index_tickets_on_route_id"
    t.index ["start_station_id"], name: "index_tickets_on_start_station_id"
    t.index ["train_id"], name: "index_tickets_on_train_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string "number"
    t.integer "current_station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "route_id"
    t.index ["current_station_id"], name: "index_trains_on_current_station_id"
    t.index ["route_id"], name: "index_trains_on_route_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
