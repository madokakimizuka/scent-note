class Brand < ApplicationRecord
  has_many :fragrances, dependent: :destroy
end
