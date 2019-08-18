class Fragrance < ApplicationRecord
  has_many :notes, dependent: :destroy
  has_many :users
  belongs_to :brand
  belongs_to :perfumer, optional: true

  mount_uploader :image, ImageUploader

  enum type: %i( Floral Aldehide Green Fruity Woody Chypr Fougere Tabacco&Leather Oriental Citrus Ozone Animalic Herbal Gourmand Other)
end
