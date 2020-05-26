class ClientSerializer < ActiveModel::Serializer
  attributes :id, :firstName, :lastName, :email, :user_id, :gender, :phone, :status, :created_at

  # def user
  #   {
  #     id: self.object.user.id,
  #     firstName: self.object.user.firstName,
  #     lastName: self.object.user.lastName,
  #     email: self.object.user.email,
  #   }
  # end
end
