# Disable for all serializers (except ArraySerializer)
ActiveModel::Serializer.root = false

ActiveModel::Serializer.setup do |config|
  config.key_format = :lower_camel
end

# Disable for ArraySerializer
ActiveModel::ArraySerializer.root = false
