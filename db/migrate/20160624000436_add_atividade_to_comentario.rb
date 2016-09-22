class AddAtividadeToComentario < ActiveRecord::Migration
  def change
    add_reference :comentarios, :atividade, index: true, foreign_key: true
  end
end
