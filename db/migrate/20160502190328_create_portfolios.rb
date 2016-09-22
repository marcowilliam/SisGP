class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :nome
      t.string :descricao
      t.date :dataInicio
      t.date :dataFim

      t.timestamps null: false
    end
  end
end
