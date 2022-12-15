class Transaction < ApplicationRecord
  belongs_to :client

  validates :description, presence: true
  validates :value, presence: true, numericality: { greater_than: 0 }
end