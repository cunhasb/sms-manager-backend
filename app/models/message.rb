class Message < ApplicationRecord
  belongs_to :campaign
  belongs_to :customer
end
