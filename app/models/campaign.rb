class Campaign < ApplicationRecord
  belongs_to :user
  has_many :messages
  has_many :customers, through: :messages
end
