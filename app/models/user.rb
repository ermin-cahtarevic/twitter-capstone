class User < ApplicationRecord
  has_many :opinions, dependent: :destroy
  
  validates :username, uniqueness: true, presence: true
  validates :full_name, presence: true
end
