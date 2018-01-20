class User < ApplicationRecord
  # has_secure_password
  has_many :campaigns
  has_many :customers
  has_many :messages, through: :campaigns
end
