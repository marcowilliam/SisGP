class AddPortfolioToProjeto < ActiveRecord::Migration
  def change
    add_reference :projetos, :portfolio, index: true, foreign_key: true
  end
end
