class User < ApplicationRecord
  has_secure_password
  has_many :clients
  accepts_nested_attributes_for :clients

  validates :email, presence: true, uniqueness: true
  validates :firstName, presence: true
  validates :lastName, presence: true
end
