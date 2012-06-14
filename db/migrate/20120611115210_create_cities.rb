class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.references :user

      t.timestamps
    end
    add_index :cities, :user_id
  end
end
