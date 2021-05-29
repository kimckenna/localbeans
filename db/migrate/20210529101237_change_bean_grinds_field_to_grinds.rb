class ChangeBeanGrindsFieldToGrinds < ActiveRecord::Migration[6.0]
  def change
    remove_column :grinds, :bean_grind
  end
end

