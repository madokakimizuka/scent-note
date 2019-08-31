class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :notes
  has_many :favorites, dependent: :destroy
  belongs_to :fragrance, optional: true

  enum sex: %i( woman man )
  enum age: %i( 10~19 20~29 30~39 40~49 50~59 60~69 70~ )
  enum favorite_type: %i( Floral Aldehide Green Fruity Woody Chypr Fougere Tabacco&Leather Oriental Citrus Ozone Animalic Herbal Gourmand Other)
  enum prefecture: %i( Hokkaido Aomori Iwate Miyagi Akita Yamagata Fukushima Ibaraki Tochigi Gunma Saitama Chiba Tokyo Kanagawa Nigata Toyama Ishikawa Hukui Yamanashi Nagano Gifu Shizuoka Aichi Mie Shiga Kyoto Osaka Hyogo Nara Wakayama Tottori Shimane Okayama Hiroshima Yamaguchi Tokushima Kagawa Ehime Kochi Fukuoka Saga Nagasaki Kumamoto Oita Miyazaki Kagoshima Okinawa )

  mount_uploader :icon, IconUploader

  before_destroy :left_admin_user


  private

  def left_admin_user
    if User.select('admin').where('admin = true').length == 1
      throw(:abort)
    end
  end
end
