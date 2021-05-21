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

ActiveRecord::Schema.define(version: 2021_05_21_211743) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "atuendos", force: :cascade do |t|
    t.text "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "atuendos_prendas", id: false, force: :cascade do |t|
    t.bigint "atuendo_id"
    t.bigint "prenda_id"
    t.index ["atuendo_id"], name: "index_atuendos_prendas_on_atuendo_id"
    t.index ["prenda_id"], name: "index_atuendos_prendas_on_prenda_id"
  end

  create_table "guardarropas", force: :cascade do |t|
    t.text "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "guardarropas_prendas", id: false, force: :cascade do |t|
    t.bigint "guardarropa_id"
    t.bigint "prenda_id"
    t.index ["guardarropa_id"], name: "index_guardarropas_prendas_on_guardarropa_id"
    t.index ["prenda_id"], name: "index_guardarropas_prendas_on_prenda_id"
  end

  create_table "prendas", force: :cascade do |t|
    t.integer "tipo"
    t.text "descripcion"
    t.integer "categoria"
    t.integer "material"
    t.text "cprimario"
    t.text "csecundario"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "guardarropa_id"
  end

end
