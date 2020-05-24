class User < ApplicationRecord
  has_secure_password

  has_many :clients
  has_many :workouts, through: :clients

  validates :email, presence: true, uniqueness: true
  validates :firstName, presence: true
  validates :lastName, presence: true
end
