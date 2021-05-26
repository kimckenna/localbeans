class AddFieldsToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :description, :text
    add_column :listings, :roast, :string
  end
end
