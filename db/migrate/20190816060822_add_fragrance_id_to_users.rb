class AddFragranceIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :signature_fragrance, foreign_key: { to_table: :fragrances }
  end
end
