class Client < ApplicationRecord
    belongs_to :user
    has_many :workouts

    validates :email, presence: true
    validates :firstName, presence: true
    validates :lastName, presence: true
end
