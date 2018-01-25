class CampaignSerializer < ActiveModel::Serializer
  attributes :id, :name,:message,:unread_messages
  # has_many :message
end
