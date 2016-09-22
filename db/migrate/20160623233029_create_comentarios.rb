class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.text :assunto
      t.text :conteudo
      t.boolean :anonimo

      t.timestamps null: false
    end
  end
end
