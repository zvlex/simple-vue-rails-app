class UserFrontDataSerializer < ActiveModel::Serializer
  attributes :id, :email, :is_active, :full_name

  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end
