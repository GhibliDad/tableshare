class Event < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_one :chatroom, dependent: :destroy

  has_one_attached :photo

  validates :title, :description, :address, :ingredients, :available_seats, presence: true
end
