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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160308185107) do

  create_table "artist_datas", force: :cascade do |t|
    t.string   "nome",              limit: 255
    t.text     "historia",          limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size",    limit: 4
    t.datetime "logo_updated_at"
  end

  create_table "commitments", force: :cascade do |t|
    t.integer  "artist_data_id", limit: 4
    t.date     "data"
    t.time     "hora"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "commitments", ["artist_data_id"], name: "index_commitments_on_artist_data_id", using: :btree

  create_table "discographys", force: :cascade do |t|
    t.integer  "artist_data_id",    limit: 4
    t.string   "nome",              limit: 255
    t.date     "data"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size",    limit: 4
    t.datetime "logo_updated_at"
  end

  add_index "discographys", ["artist_data_id"], name: "index_discographys_on_artist_data_id", using: :btree

  create_table "eddress_shows", force: :cascade do |t|
    t.integer  "commitment_id", limit: 4
    t.string   "local",         limit: 255
    t.string   "endereco",      limit: 255
    t.string   "numero",        limit: 255
    t.string   "telefone",      limit: 255
    t.string   "site",          limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "eddress_shows", ["commitment_id"], name: "index_eddress_shows_on_commitment_id", using: :btree

  create_table "emails", force: :cascade do |t|
    t.integer  "artist_data_id", limit: 4
    t.string   "email",          limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "emails", ["artist_data_id"], name: "index_emails_on_artist_data_id", using: :btree

  create_table "memberes", force: :cascade do |t|
    t.integer  "artist_data_id", limit: 4
    t.string   "nome",           limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "memberes", ["artist_data_id"], name: "index_memberes_on_artist_data_id", using: :btree

  create_table "phones", force: :cascade do |t|
    t.integer  "artist_data_id", limit: 4
    t.string   "telefone",       limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "phones", ["artist_data_id"], name: "index_phones_on_artist_data_id", using: :btree

  add_foreign_key "commitments", "artist_datas"
  add_foreign_key "discographys", "artist_datas"
  add_foreign_key "eddress_shows", "commitments"
  add_foreign_key "emails", "artist_datas"
  add_foreign_key "memberes", "artist_datas"
  add_foreign_key "phones", "artist_datas"
end
