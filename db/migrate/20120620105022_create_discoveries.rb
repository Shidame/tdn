class CreateDiscoveries < ActiveRecord::Migration
  def change
    create_table :discoveries do |t|
      t.integer :user_id
      t.integer :technology_id

      t.timestamps
    end
  end
end
