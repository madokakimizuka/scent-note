class CreateFragrances < ActiveRecord::Migration[5.2]
  def change
    create_table :fragrances do |t|
      t.string :name, null: false, index: true
      t.integer :type, index: true
      t.text :description
      t.integer :country_of_origin, index: true
      t.date :release
      t.integer :price, default: 000
      t.text :image
      t.string :URL

      t.timestamps
    end
  end
end
