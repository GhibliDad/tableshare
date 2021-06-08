class Review < ApplicationRecord
  belongs_to :reservation
  # belongs_to :user, through: :reservation

  has_one_attached :photo

  validates :heading, length: { maximum: 50 }
  validates :content, length: { maximum: 500 }
end
