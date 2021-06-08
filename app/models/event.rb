class Event < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :reviews, through: :reservations
  has_one :chatroom, dependent: :destroy

  has_one_attached :photo

  validates :title, :description, :address, :ingredients, :available_seats, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
