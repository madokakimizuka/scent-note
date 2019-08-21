class Note < ApplicationRecord
  belongs_to :fragrance
  belongs_to :user
  has_many :comments, dependent: :destroy

  enum weather: %i( sunny rainy cloudy)
  enum humidity: %i( high middle low )
  enum point: %i( neck elbow wrist ancle )
  enum scene: %i( ontime business party )

  mount_uploader :picture, PictureUploader
end
