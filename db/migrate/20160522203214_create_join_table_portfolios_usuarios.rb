class CreateJoinTablePortfoliosUsuarios < ActiveRecord::Migration
  def change
    create_join_table :portfolios, :usuarios do |t|
       t.index [:portfolio_id, :usuario_id]
       t.index [:usuario_id, :portfolio_id]
    end
  end
end
