class AddFieldToGrinds < ActiveRecord::Migration[6.0]
  def change
    add_column :grinds, :bean_grind, :string, array: true, default: []
  end
end
