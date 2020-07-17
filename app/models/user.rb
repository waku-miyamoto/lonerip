class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def already_favorited?(post)
    self.favorites.exists?(post_id: post.id)
  end
end
