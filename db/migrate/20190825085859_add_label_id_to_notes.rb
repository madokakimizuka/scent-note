class AddLabelIdToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :label_ids, :integer, array: true
    add_index :notes, :label_ids
    add_index :notes, [:label_ids,:fragrance_id]
  end

end
