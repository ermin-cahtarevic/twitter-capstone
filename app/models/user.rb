class User < ApplicationRecord
  has_many :opinions, dependent: :destroy
  has_many :followings, foreign_key: :follower_id
  has_many :followers, class_name: :Following, foreign_key: :followed_id
  
  validates :username, uniqueness: true, presence: true
  validates :full_name, presence: true
  validate :photo_size

  mount_uploader :photo, PhotoUploader

  private

    def photo_size
      if photo.size > 5.megabytes
        errors.add(:photo, "should be less than 5MB")
      end
    end
end
