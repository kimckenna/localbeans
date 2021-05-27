class CreateGrinds < ActiveRecord::Migration[6.0]
  def change
    create_table :grinds do |t|
      t.integer :bean_grind
      t.references :listing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
