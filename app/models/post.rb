class Post < ApplicationRecord
  belongs_to :small_genre
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 500 }
end
