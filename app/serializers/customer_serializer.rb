class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name,:email,:phone,:status,:image_url,:unread_messages

  has_many :campaigns
  has_many :messages, through: :campaigns
end
