class AddBrandIdToFragrance < ActiveRecord::Migration[5.2]
  def change
    add_reference :fragrances, :brand, foreign_key: true
    add_reference :fragrances, :perfumer, foreign_key: true
  end
end
