class Customer < ApplicationRecord
  belongs_to :user
  has_many :messages
  has_many :campaigns, through: :messages
end
