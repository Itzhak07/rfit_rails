class ClientSerializer < ActiveModel::Serializer
  attributes :id, :firstName, :lastName, :email, :user_id, :user, :gender, :status, :created_at

  has_one :user

  def user
    {
      id: self.object.user.id,
      firstName: self.object.user.firstName,
      lastName: self.object.user.lastName,
      email: self.object.user.email,
    }
  end
end
