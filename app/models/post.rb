class Post < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  #validates :image, presence: true
  validates :place, presence: true, length: { in: 1..20 } 
  validates :description, presence: true, length: { maximum: 200 }
  validates :date, presence: true
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  attachment :image

  geocoded_by :place
  after_validation :geocode, if: :place_changed?
end
