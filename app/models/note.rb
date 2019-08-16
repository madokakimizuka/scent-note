class Note < ApplicationRecord
  belongs_to :fragrance
  belongs_to :user

  enum weather: %i( sunny rainy cloudy)
  enum humidity: %i( high middle low )
  enum point: %i( neck elbow wrist ancle )
  enum scene: %i( ontime business party )
end
