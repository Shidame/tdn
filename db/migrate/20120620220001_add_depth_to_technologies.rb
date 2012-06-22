class AddDepthToTechnologies < ActiveRecord::Migration
  def change
    add_column :technologies, :depth, :integer
  end
end
