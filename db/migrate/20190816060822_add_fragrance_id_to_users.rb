class AddFragranceIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :fragrances, :signature_fragrance, foreign_key: { to_table: :users }
  end
end
