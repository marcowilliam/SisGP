class AddUsuarioToComentario < ActiveRecord::Migration
  def change
    add_reference :comentarios, :usuario, index: true, foreign_key: true
  end
end
