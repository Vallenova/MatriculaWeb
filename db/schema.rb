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

ActiveRecord::Schema.define(version: 20140705054430) do

  create_table "alumnos", force: true do |t|
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "sexo"
    t.date     "fec_nac"
    t.string   "dni"
    t.string   "direccion"
    t.integer  "apoderado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "alumnos", ["apoderado_id"], name: "index_alumnos_on_apoderado_id"
  add_index "alumnos", ["dni"], name: "index_alumnos_on_dni", unique: true

  create_table "apoderados", force: true do |t|
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "sexo"
    t.date     "fec_nac"
    t.string   "dni"
    t.string   "telefono"
    t.string   "celular"
    t.string   "email"
    t.integer  "usuario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "direccion"
  end

  add_index "apoderados", ["dni"], name: "index_apoderados_on_dni", unique: true

  create_table "usuarios", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true

end
