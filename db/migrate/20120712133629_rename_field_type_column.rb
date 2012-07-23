class RenameFieldTypeColumn < ActiveRecord::Migration
  def change
    rename_column :tiles, :field_type, :land_type
  end
end
