class SmallGenre < ApplicationRecord
  has_many :posts
  belongs_to :big_genre
  
  validates :small_genre, presence: true, length: { maximum: 100 }
end
