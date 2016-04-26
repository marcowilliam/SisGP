class CreateProcessos < ActiveRecord::Migration
  def change
    create_table :processos do |t|
      t.string :nome
      t.text :descricao
      t.date :dataInicio
      t.date :dataFim

      t.timestamps null: false
    end
  end
end
