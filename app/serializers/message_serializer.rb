class MessageSerializer < ActiveModel::Serializer
  attributes :id, :label_ids, :name, :message

end
