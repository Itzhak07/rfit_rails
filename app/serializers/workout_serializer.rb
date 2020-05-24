class WorkoutSerializer < ActiveModel::Serializer
  attributes :id, :notes, :date, :startDate, :endDate, :client, :work_sets
  has_one :client
  has_many :work_sets


  def client
    {
      id: self.object.client_id,
      firstName: self.object.client.firstName,
      lastName: self.object.client.lastName,
      email: self.object.client.email,
      phone: self.object.client.phone,
      gender: self.object.client.gender,
      status: self.object.client.status,
    }
  end

  
end
