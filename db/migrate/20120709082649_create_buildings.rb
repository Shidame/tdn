class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.references :building_type
      t.references :city

      t.timestamps
    end

    add_column :tiles, :building_id, :integer
  end
end
