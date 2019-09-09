class Note < ApplicationRecord
  belongs_to :fragrance
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :label, optional: true
  validates :fragrance_id, presence:true

  def favorite?(note, user)
    note.favorites.find_by(user_id: user.id)
  end

  enum weather: %i( sunny rainy cloudy stormy snowy foggy)
  enum humidity: %i( high middle low )
  enum point: %i( neck elbow wrist ancle waist back thigh knee heel sole shoulder chest )
  enum scene: %i( ontime business party night morning )

  mount_uploader :picture, PictureUploader
end
