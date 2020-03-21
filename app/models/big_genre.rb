class BigGenre < ApplicationRecord
  validates :big_genre, presence: true, length: { maximum: 100 }
end
