class RemoveBeanGrindFromListings < ActiveRecord::Migration[6.0]
  def change
    remove_column :listings, :bean_grind, :integer
  end
end
