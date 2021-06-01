class Review < ApplicationRecord
  belongs_to :reservation

  validates :heading, length: { maximum: 20 }
  validates :content, length: { maximum: 250 }
end
