class UserSerializer < ActiveModel::Serializer
  attributes :id, :name,:family_name,:given_name,:email,:phone,:image_url

  # has_many :campaigns
  # has_many :messages, through: :campaigns
end
