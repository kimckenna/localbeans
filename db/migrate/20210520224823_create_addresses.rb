class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :address_line1
      t.string :address_line2
      t.string :suburb
      t.integer :state
      t.integer :postcode
      t.references :stockist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
