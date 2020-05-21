class User < ApplicationRecord
  has_secure_password
  has_many :workouts
  has_many :clients, through: :workouts

  validates :email, presence: true, uniqueness: true
  validates :firstName, presence: true
  validates :lastName, presence: true
end
