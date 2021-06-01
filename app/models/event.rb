class Event < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one :chatroom

  validates :title, :start, :end, :description, :address, :ingredients, :available_seats, presence: true
end
