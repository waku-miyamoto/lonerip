class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :image, presence: true
  validates :name, length: { maximum: 30 }, presence: true
  validates :text, presence: true

end
