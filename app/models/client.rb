class Client < ApplicationRecord
    has_many :workouts
    has_one :user


    validates :email, presence: true
    validates :firstName, presence: true
    validates :lastName, presence: true
end
