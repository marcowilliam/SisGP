class AddProcessoRefToAtividade < ActiveRecord::Migration
  def change
    add_reference :atividades, :processo, index: true, foreign_key: true
  end
end
