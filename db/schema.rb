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

ActiveRecord::Schema.define(version: 2021_09_23_100338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "airports", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "uid"
    t.string "name"
    t.string "city"
    t.string "country"
    t.string "country_alpha2"
    t.string "iata"
    t.string "icao"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.integer "altitude"
    t.string "timezone"
    t.string "dst"
    t.string "timezone_olson"
    t.string "kind"
    t.string "source"
    t.integer "passenger_volume"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_alpha2"], name: "index_airports_on_country_alpha2"
    t.index ["iata", "icao", "name"], name: "index_airports_on_iata_and_icao_and_name"
    t.index ["iata"], name: "index_airports_on_iata", unique: true
    t.index ["icao"], name: "index_airports_on_icao"
    t.index ["name"], name: "index_airports_on_name"
    t.index ["passenger_volume"], name: "index_airports_on_passenger_volume"
  end

end
