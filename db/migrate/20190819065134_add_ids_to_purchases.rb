class AddIdsToPurchases < ActiveRecord::Migration[5.2]
  def change
    add_reference :purchases, :fragrance, foreign_key: true, null: false
    add_reference :purchases, :user, foreign_key: true, null: false
  end
end
