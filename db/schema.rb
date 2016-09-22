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

ActiveRecord::Schema.define(version: 20160624000436) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "atividades", force: :cascade do |t|
    t.string   "nome"
    t.text     "descricao"
    t.date     "dataInicio"
    t.date     "dataFim"
    t.boolean  "finalizada"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "processo_id"
  end

  add_index "atividades", ["processo_id"], name: "index_atividades_on_processo_id", using: :btree

  create_table "atividades_usuarios", id: false, force: :cascade do |t|
    t.integer "atividade_id", null: false
    t.integer "usuario_id",   null: false
  end

  add_index "atividades_usuarios", ["atividade_id", "usuario_id"], name: "index_atividades_usuarios_on_atividade_id_and_usuario_id", using: :btree
  add_index "atividades_usuarios", ["usuario_id", "atividade_id"], name: "index_atividades_usuarios_on_usuario_id_and_atividade_id", using: :btree

  create_table "atualizavels", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comentarios", force: :cascade do |t|
    t.text     "assunto"
    t.text     "conteudo"
    t.boolean  "anonimo"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "usuario_id"
    t.integer  "atividade_id"
  end

  add_index "comentarios", ["atividade_id"], name: "index_comentarios_on_atividade_id", using: :btree
  add_index "comentarios", ["usuario_id"], name: "index_comentarios_on_usuario_id", using: :btree

  create_table "departamentos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "liks", force: :cascade do |t|
    t.text     "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizacaos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portfolios", force: :cascade do |t|
    t.string   "nome"
    t.string   "descricao"
    t.date     "dataInicio"
    t.date     "dataFim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portfolios_usuarios", id: false, force: :cascade do |t|
    t.integer "portfolio_id", null: false
    t.integer "usuario_id",   null: false
  end

  add_index "portfolios_usuarios", ["portfolio_id", "usuario_id"], name: "index_portfolios_usuarios_on_portfolio_id_and_usuario_id", using: :btree
  add_index "portfolios_usuarios", ["usuario_id", "portfolio_id"], name: "index_portfolios_usuarios_on_usuario_id_and_portfolio_id", using: :btree

  create_table "processos", force: :cascade do |t|
    t.string   "nome"
    t.text     "descricao"
    t.date     "dataInicio"
    t.date     "dataFim"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "projeto_id"
  end

  add_index "processos", ["projeto_id"], name: "index_processos_on_projeto_id", using: :btree

  create_table "processos_usuarios", id: false, force: :cascade do |t|
    t.integer "usuario_id",  null: false
    t.integer "processo_id", null: false
  end

  add_index "processos_usuarios", ["processo_id", "usuario_id"], name: "index_processos_usuarios_on_processo_id_and_usuario_id", using: :btree
  add_index "processos_usuarios", ["usuario_id", "processo_id"], name: "index_processos_usuarios_on_usuario_id_and_processo_id", using: :btree

  create_table "projetos", force: :cascade do |t|
    t.string   "nome"
    t.text     "descricao"
    t.date     "dataInicio"
    t.date     "dataFim"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "portfolio_id"
  end

  add_index "projetos", ["portfolio_id"], name: "index_projetos_on_portfolio_id", using: :btree

  create_table "projetos_usuarios", id: false, force: :cascade do |t|
    t.integer "projeto_id", null: false
    t.integer "usuario_id", null: false
  end

  add_index "projetos_usuarios", ["projeto_id", "usuario_id"], name: "index_projetos_usuarios_on_projeto_id_and_usuario_id", using: :btree
  add_index "projetos_usuarios", ["usuario_id", "projeto_id"], name: "index_projetos_usuarios_on_usuario_id_and_projeto_id", using: :btree

  create_table "usuarios", force: :cascade do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "telefone"
    t.string   "login"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_foreign_key "atividades", "processos"
  add_foreign_key "comentarios", "atividades"
  add_foreign_key "comentarios", "usuarios"
  add_foreign_key "processos", "projetos"
  add_foreign_key "projetos", "portfolios"
end
