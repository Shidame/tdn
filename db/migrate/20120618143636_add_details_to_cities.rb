class AddDetailsToCities < ActiveRecord::Migration
  def change
    add_column :cities, :laborer, :integer, default: 0
    add_column :cities, :deben, :integer, default: 0
    add_column :cities, :happiness, :integer, default: 0
  end
end
