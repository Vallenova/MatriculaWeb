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

ActiveRecord::Schema.define(version: 20140619214848) do

  create_table "apoderados", force: true do |t|
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "sexo"
    t.date     "fec_nac"
    t.string   "dni"
    t.string   "telefono"
    t.string   "celular"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "direccion"
  end

  add_index "apoderados", ["dni"], name: "index_apoderados_on_dni", unique: true

end
