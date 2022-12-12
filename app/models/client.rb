class Client < ApplicationRecord
  validates :name, :taxnumber, :bank_id, presence: true
end
