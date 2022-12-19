class Transaction < ApplicationRecord
  belongs_to :client

  validates :description, :value, presence: true
end