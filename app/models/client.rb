class Client < ApplicationRecord
    has_many :workouts
    has_many :clients, through: :workouts


    validates :email, presence: true
    validates :firstName, presence: true
    validates :lastName, presence: true
end
