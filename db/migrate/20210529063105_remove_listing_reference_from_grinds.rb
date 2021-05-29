class RemoveListingReferenceFromGrinds < ActiveRecord::Migration[6.0]
  def change
    remove_reference :grinds, :listing, null: false, foreign_key: true
  end
end
