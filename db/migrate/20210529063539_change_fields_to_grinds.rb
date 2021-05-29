class ChangeFieldsToGrinds < ActiveRecord::Migration[6.0]
  def change
    change_column :grinds, :bean_grind, :string
  end
end
