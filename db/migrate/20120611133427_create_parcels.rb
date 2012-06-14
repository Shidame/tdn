class CreateParcels < ActiveRecord::Migration
  def change
    create_table :parcels do |t|
      t.string :land_type
      t.boolean :purchased, default: false
      t.belongs_to :city

      t.timestamps
    end
  end
end
