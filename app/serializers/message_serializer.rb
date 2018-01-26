class MessageSerializer < ActiveModel::Serializer
  attributes :id, :label_ids, :name, :message,:message_type,:read

  belongs_to :campaign,include: [:id]
  belongs_to :customer,include: [:id]

end
