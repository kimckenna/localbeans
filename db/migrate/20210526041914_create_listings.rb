class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :origin
      t.text :flavour_profile
      t.integer :bean_type
      t.integer :bean_grind
      t.references :stockist, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
