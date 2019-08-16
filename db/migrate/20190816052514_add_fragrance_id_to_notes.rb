class AddFragranceIdToNotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :notes, :fragrance, foreign_key: true, null: false
    add_reference :notes, :user, foreign_key: true, null: false
  end
end
