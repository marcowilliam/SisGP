class CreateJoinTableProjetosUsuarios < ActiveRecord::Migration
  def change
    create_join_table :projetos, :usuarios do |t|
       t.index [:projeto_id, :usuario_id]
       t.index [:usuario_id, :projeto_id]
    end
  end
end
