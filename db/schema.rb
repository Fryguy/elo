# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120315234524) do

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         :default => 0
    t.string   "comment"
    t.string   "remote_address"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], :name => "associated_index"
  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "games", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "loser_score",       :default => 0
    t.integer  "participant_count"
    t.integer  "league_id"
  end

  add_index "games", ["league_id"], :name => "index_games_on_league_id"

  create_table "leagues", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leagues_players", :id => false, :force => true do |t|
    t.integer "league_id"
    t.integer "player_id"
  end

  add_index "leagues_players", ["league_id", "player_id"], :name => "index_leagues_players_on_league_id_and_player_id"
  add_index "leagues_players", ["player_id", "league_id"], :name => "index_leagues_players_on_player_id_and_league_id"

  create_table "participants", :force => true do |t|
    t.integer  "player_id"
    t.integer  "game_id"
    t.boolean  "win"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "participants", ["game_id"], :name => "index_outcomes_on_game_id"
  add_index "participants", ["player_id"], :name => "index_outcomes_on_player_id"

  create_table "players", :force => true do |t|
    t.string   "email"
    t.integer  "rank"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "doubles_rank"
    t.integer  "last_game_id"
    t.integer  "last_expected_margin"
  end

end
