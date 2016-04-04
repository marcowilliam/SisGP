class AddAtividadesRefToProjeto < ActiveRecord::Migration
  def change
    add_reference :projetos, :atividades, index: true, foreign_key: true
  end
end
