class Note < ApplicationRecord
  belongs_to :fragrance
  belongs_to :user
  has_many :comments, dependent: :destroy
  belongs_to :label, optional: true
  validates :fragrance_id, presence:true

  enum weather: %i( sunny rainy cloudy stormy snowy foggy)
  enum humidity: %i( high middle low )
  enum point: %i( neck elbow wrist ancle waist back thigh knee heel sole shoulder chest )
  enum scene: %i( ontime business party night morning )

  mount_uploader :picture, PictureUploader
end
