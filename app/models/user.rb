class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events
  has_many :reservations, through: :events
  has_many :reservations
  has_many :messages
  has_many :reviews, through: :reservations

  # regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/

  validates :first_name, :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 4 }
end
