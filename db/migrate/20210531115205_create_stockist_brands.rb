class CreateStockistBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :stockist_brands do |t|
      t.references :stockist, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
