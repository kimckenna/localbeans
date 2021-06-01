class AddFieldToListing < ActiveRecord::Migration[6.0]
  def change
    add_reference :listings, :brand, null: false, foreign_key: true
  end
end
