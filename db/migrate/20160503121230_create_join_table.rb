class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :usuarios, :processos do |t|
       t.index [:usuario_id, :processo_id]
       t.index [:processo_id, :usuario_id]
    end
  end
end
