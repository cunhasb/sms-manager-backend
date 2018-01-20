class PhoneNumberSerializer < ActiveModel::Serializer
  attributes :id, :number, :subscriber, :country, :status
  has_one :carrier
end
