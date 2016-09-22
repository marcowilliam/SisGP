class CreateProjetos < ActiveRecord::Migration
  def change
    create_table :projetos do |t|
      t.string :nome
      t.text :descricao
      t.date :dataInicio
      t.date :dataFim

      t.timestamps null: false
    end
  end
end
