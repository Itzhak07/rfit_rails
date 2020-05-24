class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstName, :lastName, :email, :created_at, :updated_at, :clients, :workouts

  has_many :workouts
  has_many :clients

end   
