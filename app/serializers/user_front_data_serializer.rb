class UserFrontDataSerializer < ActiveModel::Serializer
  attributes :id, :email, :full_name, :deleted_at

  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end
