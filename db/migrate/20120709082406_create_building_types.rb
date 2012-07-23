class CreateBuildingTypes < ActiveRecord::Migration
  def change
    create_table :building_types do |t|
      t.string :name
      t.string :description
      t.integer :width
      t.integer :height
      t.string :land_type_required

      t.timestamps
    end
  end
end
