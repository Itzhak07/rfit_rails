class Workout < ApplicationRecord
    belongs_to :client
    belongs_to :user
    has_many :work_sets, :dependent => :destroy
end
