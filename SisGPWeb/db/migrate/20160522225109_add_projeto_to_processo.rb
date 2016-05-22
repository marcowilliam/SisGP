class AddProjetoToProcesso < ActiveRecord::Migration
  def change
    add_reference :processos, :projeto, index: true, foreign_key: true
  end
end
