class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :content
      t.date :date
      t.integer :weather, index: true
      t.integer :humidity, index: true
      t.integer :point, index: true
      t.integer :scene, index: true
      t.string :layerd
      t.boolean :want
      t.text :picture

      t.timestamps
    end
  end
end
