class User < ApplicationRecord
  before_destroy :remove_followings

  has_many :opinions, dependent: :destroy
  has_many :followings, foreign_key: :follower_id
  has_many :followers, class_name: :Following, foreign_key: :followed_id

  validates :username, uniqueness: true, presence: true
  validates :full_name, presence: true
  validate :photo_size
  validate :cover_size

  mount_uploader :photo, PhotoUploader
  mount_uploader :cover_image, CoverImageUploader

  private

  def photo_size
    errors.add(:photo, 'should be less than 5MB') if photo.size > 5.megabytes
  end

  def cover_size
    errors.add(:cover_image, 'should be less than 5MB') if cover_image.size > 5.megabytes
  end

  def remove_followings
    Following.where(followed_id: id).destroy_all
    Following.where(follower_id: id).destroy_all
  end
end
