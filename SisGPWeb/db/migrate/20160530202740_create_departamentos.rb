class CreateDepartamentos < ActiveRecord::Migration
  def change
    create_table :departamentos do |t|

      t.timestamps null: false
    end
  end
end
