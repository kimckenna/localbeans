class CreateSizes < ActiveRecord::Migration[6.0]
  def change
    create_table :sizes do |t|
      t.integer :size
      t.decimal :price, precision: 8, scale: 2
      t.boolean :active
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
