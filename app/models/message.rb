class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user

  validates :content, length: { maximum: 250 }
end
