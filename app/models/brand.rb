class Brand < ApplicationRecord
  has_many :fragrances, dependent: :destroy
  has_many :perfumers
end
