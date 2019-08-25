class Labeling < ApplicationRecord
  belongs_to :fragrance
  belongs_to :label
  validates :fragrance_id,presence:true
  validates :label_id,presence:true
end
