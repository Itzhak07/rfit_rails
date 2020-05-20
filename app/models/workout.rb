class Workout < ApplicationRecord
    belongs_to :client
    belongs_to :user
    has_one :client
    has_one :user
end
