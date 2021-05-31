class AddBeanGrindInGrinds < ActiveRecord::Migration[6.0]
  def change
    add_column :grinds, :bean_grind, :string
  end
end
