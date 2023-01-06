class Client < ApplicationRecord
  has_many :transactions

  validates :name, :taxnumber, :bank_id, presence: true

  def balance
    transactions.reduce(BigDecimal('0')) { |sum, transaction| sum + BigDecimal(transaction.value.to_s) }.to_f
  end
end
