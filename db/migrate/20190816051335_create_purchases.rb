class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.date :date
      t.date :opening_date
      t.date :expiration_date
      t.string :where_to_buy

      t.timestamps
    end
  end
end
