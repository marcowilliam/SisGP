class AddProcessosRefToProjeto < ActiveRecord::Migration
  def change
    add_reference :projetos, :processos, index: true, foreign_key: true
  end
end
