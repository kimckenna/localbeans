class ChangeIntegerLimitInStockists < ActiveRecord::Migration[6.0]
  def change
    change_column :stockists, :abn, :integer, limit: 8
  end
end
