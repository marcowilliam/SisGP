class AddProjetosRefToPortfolio < ActiveRecord::Migration
  def change
    add_reference :portfolios, :projetos, index: true, foreign_key: true
  end
end
