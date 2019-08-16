class CreatePerfumers < ActiveRecord::Migration[5.2]
  def change
    create_table :perfumers do |t|
      t.string :name, null: false, index: true
      t.references :destination_brand, foreign_key: { to_table: :fragrances}
      t.references :masterpiece, foreign_key: { to_table: :fragrances }
      t.integer :country
      t.text :thought

      t.timestamps
    end
  end
end
