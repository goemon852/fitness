class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 10 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }    
  has_secure_password
  
  has_many :favorites, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, through: :favorites, source: :post
  
  def like(post)
    self.favorites.find_or_create_by(post_id: post.id)
  end
    
  def unlike(post)
    favorite = self.favorites.find_by(post_id: post.id)
    favorite.destroy if favorite
  end
    
  def like?(post)
    self.likes.include?(post)
  end  
  
end
