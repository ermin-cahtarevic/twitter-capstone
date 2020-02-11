class Opinion < ApplicationRecord
  belongs_to :user

  validates :text, presence: true
end
