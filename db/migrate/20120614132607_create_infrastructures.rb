class CreateInfrastructures < ActiveRecord::Migration
  def change
    create_table :infrastructures do |t|
      t.string :name
      t.string :description
      t.string :land
      t.string :buildable_on

      t.timestamps
    end

    change_table :parcels do |t|
      t.references :infrastructure
    end
  end
end
