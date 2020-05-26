class WorkSetSerializer < ActiveModel::Serializer
  attributes :id, :rounds, :reps, :weight, :workout_id, :movement
  has_one :movement

end
