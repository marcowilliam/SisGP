class CreateAtualizavels < ActiveRecord::Migration
  def change
    create_table :atualizavels do |t|

      t.timestamps null: false
    end
  end
end
