class CreateJoinTableAtividadeUsuario < ActiveRecord::Migration
  def change
    create_join_table :atividades, :usuarios do |t|
       t.index [:atividade_id, :usuario_id]
       t.index [:usuario_id, :atividade_id]
    end
  end
end
