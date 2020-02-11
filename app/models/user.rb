class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates :full_name, presence: true 
end
