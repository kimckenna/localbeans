class RenameNameColumnToBrandFromBrands < ActiveRecord::Migration[6.0]
  def change
    rename_column :brands, :name, :brand
  end
end
