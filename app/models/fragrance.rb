class Fragrance < ApplicationRecord
  has_many :notes, dependent: :destroy
end
