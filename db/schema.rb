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

ActiveRecord::Schema.define(version: 2019_05_23_221438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "achievements", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.citext "title", null: false
    t.integer "points", null: false
    t.string "achievement_type_cd", null: false
    t.string "order", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["achievement_type_cd"], name: "index_achievements_on_achievement_type_cd"
    t.index ["order"], name: "index_achievements_on_order"
  end

  create_table "participants", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.citext "username", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["username"], name: "index_participants_on_username"
  end

  create_table "participations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "participant_id", null: false
    t.uuid "season_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["participant_id", "season_id"], name: "index_participations_on_participant_id_and_season_id", unique: true
    t.index ["participant_id"], name: "index_participations_on_participant_id"
    t.index ["season_id"], name: "index_participations_on_season_id"
  end

  create_table "seasons", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.citext "title", null: false
    t.date "started_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["started_at"], name: "index_seasons_on_started_at"
    t.index ["title"], name: "index_seasons_on_title"
  end

  add_foreign_key "participations", "participants"
  add_foreign_key "participations", "seasons"
end
