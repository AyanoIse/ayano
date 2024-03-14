class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :ohayos, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_ohayos, through: :likes, source: :ohayo
  has_many :tweets, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :gooded_tweets, through: :goods, source: :tweet
  has_many :comments, dependent: :destroy
  has_many :letters, dependent: :destroy
  validates :name, presence: true
  validates :profile, length: { maximum: 200 }
    
  def already_liked?(ohayo)
    self.likes.exists?(ohayo_id: ohayo.id)
  end

  def already_gooded?(tweet)
    self.goods.exists?(tweet_id: tweet.id)
  end
  
  mount_uploader :image, ImageUploader

end
