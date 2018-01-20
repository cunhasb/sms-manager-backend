class CarrierSerializer < ActiveModel::Serializer
  attributes :id, :name, :country, :gateway_text, :gateway_mime, :status
end
