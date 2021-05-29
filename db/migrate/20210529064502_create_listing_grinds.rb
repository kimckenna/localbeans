class CreateListingGrinds < ActiveRecord::Migration[6.0]
  def change
    create_table :listing_grinds do |t|
      t.references :grind, null: false, foreign_key: true
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
