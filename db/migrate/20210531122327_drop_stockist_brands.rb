class DropStockistBrands < ActiveRecord::Migration[6.0]
  def change
    drop_table :stockist_brands
  end
end
