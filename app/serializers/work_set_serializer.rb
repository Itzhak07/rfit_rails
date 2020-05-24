class WorkSetSerializer < ActiveModel::Serializer
  attributes :id, :rounds, :reps, :weight, :movement
  has_one :movement

end
