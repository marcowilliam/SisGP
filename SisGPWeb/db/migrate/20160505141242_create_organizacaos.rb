class CreateOrganizacaos < ActiveRecord::Migration
  def change
    create_table :organizacaos do |t|

      t.timestamps null: false
    end
  end
end
