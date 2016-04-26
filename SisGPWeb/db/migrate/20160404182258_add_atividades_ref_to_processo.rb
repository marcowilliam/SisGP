class AddAtividadesRefToProcesso < ActiveRecord::Migration
  def change
    add_reference :processos, :atividades, index: true, foreign_key: true
  end
end
