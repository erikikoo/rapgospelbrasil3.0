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

ActiveRecord::Schema.define(version: 20160708224410) do

  create_table "artist_datas", force: :cascade do |t|
    t.string   "nome",       limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "artist_id",  limit: 4
    t.boolean  "aprovado",               default: false
    t.boolean  "bloqueado",              default: false
    t.string   "logo",       limit: 255
  end

  add_index "artist_datas", ["artist_id"], name: "index_artist_datas_on_artist_id", using: :btree

  create_table "artists", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.boolean  "admin",                              default: false
  end

  add_index "artists", ["email"], name: "index_artists_on_email", unique: true, using: :btree
  add_index "artists", ["reset_password_token"], name: "index_artists_on_reset_password_token", unique: true, using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "commitments", force: :cascade do |t|
    t.integer  "artist_data_id", limit: 4
    t.string   "local",          limit: 255
    t.string   "endereco",       limit: 255
    t.string   "numero",         limit: 255
    t.string   "telefone",       limit: 255
    t.string   "site",           limit: 255
    t.date     "data"
    t.time     "hora"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "commitments", ["artist_data_id"], name: "index_commitments_on_artist_data_id", using: :btree

  create_table "discographys", force: :cascade do |t|
    t.integer  "artist_data_id", limit: 4
    t.string   "nome",           limit: 255
    t.date     "data"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "logo",           limit: 255
  end

  add_index "discographys", ["artist_data_id"], name: "index_discographys_on_artist_data_id", using: :btree

  create_table "emails", force: :cascade do |t|
    t.integer  "artist_data_id", limit: 4
    t.string   "email",          limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "emails", ["artist_data_id"], name: "index_emails_on_artist_data_id", using: :btree

  create_table "historys", force: :cascade do |t|
    t.integer  "artist_data_id", limit: 4
    t.text     "historia",       limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "historys", ["artist_data_id"], name: "index_historys_on_artist_data_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "artist_data_id", limit: 4
    t.string   "ip",             limit: 255
    t.boolean  "curtido",                    default: false
    t.boolean  "unlike",                     default: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "likes", ["artist_data_id"], name: "index_likes_on_artist_data_id", using: :btree

  create_table "link_sound_clouds", force: :cascade do |t|
    t.integer  "artist_data_id", limit: 4
    t.string   "link",           limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "link_sound_clouds", ["artist_data_id"], name: "index_link_sound_clouds_on_artist_data_id", using: :btree

  create_table "notices", force: :cascade do |t|
    t.integer  "artist_data_id", limit: 4
    t.text     "noticia",        limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "titulo",         limit: 255
    t.string   "logo",           limit: 255
  end

  add_index "notices", ["artist_data_id"], name: "index_notices_on_artist_data_id", using: :btree

  create_table "phones", force: :cascade do |t|
    t.integer  "artist_data_id", limit: 4
    t.string   "telefone",       limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "phones", ["artist_data_id"], name: "index_phones_on_artist_data_id", using: :btree

  create_table "rede_sociais", force: :cascade do |t|
    t.integer  "artist_data_id", limit: 4
    t.string   "facebook",       limit: 255
    t.string   "twitter",        limit: 255
    t.string   "instagram",      limit: 255
    t.string   "googleplus",     limit: 255
    t.string   "linkedid",       limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "rede_sociais", ["artist_data_id"], name: "index_rede_sociais_on_artist_data_id", using: :btree

  create_table "top5s", force: :cascade do |t|
    t.integer  "artist_id",  limit: 4
    t.string   "titulo",     limit: 255
    t.string   "artista",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "titulo2",    limit: 255
    t.string   "artista2",   limit: 255
    t.string   "titulo3",    limit: 255
    t.string   "artista3",   limit: 255
    t.string   "titulo4",    limit: 255
    t.string   "artista4",   limit: 255
    t.string   "titulo5",    limit: 255
    t.string   "artista5",   limit: 255
  end

  add_index "top5s", ["artist_id"], name: "index_top5s_on_artist_id", using: :btree

  create_table "videos", force: :cascade do |t|
    t.integer  "artist_data_id", limit: 4
    t.string   "link",           limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "artist_id",      limit: 4
  end

  add_index "videos", ["artist_data_id"], name: "index_videos_on_artist_data_id", using: :btree
  add_index "videos", ["artist_id"], name: "index_videos_on_artist_id", using: :btree

  create_table "words", force: :cascade do |t|
    t.integer  "artist_data_id", limit: 4
    t.string   "titulo",         limit: 255
    t.text     "texto",          limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "logo",           limit: 255
  end

  add_index "words", ["artist_data_id"], name: "index_words_on_artist_data_id", using: :btree

  add_foreign_key "artist_datas", "artists"
  add_foreign_key "commitments", "artist_datas"
  add_foreign_key "discographys", "artist_datas"
  add_foreign_key "emails", "artist_datas"
  add_foreign_key "historys", "artist_datas"
  add_foreign_key "likes", "artist_datas"
  add_foreign_key "link_sound_clouds", "artist_datas"
  add_foreign_key "notices", "artist_datas"
  add_foreign_key "phones", "artist_datas"
  add_foreign_key "rede_sociais", "artist_datas"
  add_foreign_key "top5s", "artists"
  add_foreign_key "videos", "artist_datas"
  add_foreign_key "videos", "artists"
  add_foreign_key "words", "artist_datas"
end
