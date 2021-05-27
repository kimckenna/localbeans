class AddFieldsToReservations < ActiveRecord::Migration[6.0]
  def change
    add_reference :reservations, :grind, null: false, foreign_key: true
  end
end
