class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :name, null: false, index: true
      t.string :founder
      t.integer :country, index: true
      t.text :concept
      t.date :found_year
      t.string :official

      t.timestamps
    end
  end
end
