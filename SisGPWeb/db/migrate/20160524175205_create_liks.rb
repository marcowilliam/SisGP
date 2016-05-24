class CreateLiks < ActiveRecord::Migration
  def change
    create_table :liks do |t|
      t.text :url

      t.timestamps null: false
    end
  end
end
