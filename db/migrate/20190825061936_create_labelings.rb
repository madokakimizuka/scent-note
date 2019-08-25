class CreateLabelings < ActiveRecord::Migration[5.2]
  def change
    create_table :labelings do |t|
      t.integer :fragrance_id
      t.integer :label_id

      t.timestamps
    end
    add_index :labelings, :fragrance_id
    add_index :labelings, :label_id
    add_index :labelings, [:fragrance_id,:label_id],unique: true
  end
end
