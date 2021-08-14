class Post < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :image

  validates :image, presence: true
  validates :place, presence: true, length: { in: 1..20 }
  validates :description, presence: true, length: { maximum: 200 }
  validates :date, presence: true

  geocoded_by :place
  after_validation :geocode, if: :place_changed?

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Post.where(place: content)
    elsif method == 'forward'
      Post.where('place LIKE ?', content + '%')
    elsif method == 'backward'
      Post.where('place LIKE ?', '%' + content)
    else
      Post.where('place LIKE ?', '%'+content+'%')
    end
  end
end
