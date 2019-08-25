class Label < ApplicationRecord
  validates :name,presence:true,length:{maximum:30}
  has_many :fragrances, through: :labelings
  has_many :fragrances, dependent: :destroy
end
