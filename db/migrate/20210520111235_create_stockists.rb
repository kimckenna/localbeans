class CreateStockists < ActiveRecord::Migration[6.0]
  def change
    create_table :stockists do |t|
      t.string :business_name
      t.integer :abn
      t.boolean :verified
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
