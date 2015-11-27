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

ActiveRecord::Schema.define(version: 20151126044508) do

  create_table "animals", force: :cascade do |t|
    t.string   "name"
    t.string   "specie"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "usuario_id"
    t.string   "slug"
    t.string   "picture"
    t.integer  "reviews_count"
  end

  add_index "animals", ["slug"], name: "index_animals_on_slug", unique: true
  add_index "animals", ["usuario_id"], name: "index_animals_on_usuario_id"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "reviews", force: :cascade do |t|
    t.integer  "reviewer_id"
    t.integer  "reviewed_id"
    t.integer  "points"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "reviews", ["reviewer_id", "reviewed_id"], name: "index_reviews_on_reviewer_id_and_reviewed_id", unique: true

  create_table "usuarios", force: :cascade do |t|
    t.string   "nome"
    t.string   "sobrenome"
    t.string   "idade"
    t.string   "sexo"
    t.string   "email"
    t.string   "perfil"
    t.string   "endereco"
    t.string   "telefone"
    t.string   "password"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.integer  "reviewed_id"
    t.integer  "reviewer_id"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true

end
