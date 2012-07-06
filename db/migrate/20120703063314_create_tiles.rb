class CreateTiles < ActiveRecord::Migration
  def change
    create_table :tiles do |t|
      t.integer :x
      t.integer :y
      t.string :field_type
      t.belongs_to :city

      t.timestamps
    end
  end
end
