class CampaignSerializer < ActiveModel::Serializer
  attributes :id, :name,:unread_messages
  # has_many :message
end
