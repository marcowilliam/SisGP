class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :nome
      t.string :descricao
      t.date :dataInicio
      t.date :dataFim
      t.belongs_to :dono, class_name: 'Usuario'

      t.timestamps null: false
    end
  end
end
