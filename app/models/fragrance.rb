class Fragrance < ApplicationRecord
  has_many :notes, dependent: :destroy
  has_many :users
end
