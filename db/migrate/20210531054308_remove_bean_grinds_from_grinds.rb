class RemoveBeanGrindsFromGrinds < ActiveRecord::Migration[6.0]
  def change
    remove_column :grinds, :bean_grind, :string,array: true, default: []
  end
end
