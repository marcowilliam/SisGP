class AddProjetoRefToAtividade < ActiveRecord::Migration
  def change
    add_reference :atividades, :projeto, index: true, foreign_key: true
  end
end
