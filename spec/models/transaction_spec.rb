require 'rails_helper'

RSpec.describe Transaction, type: :model do
  before do
    @client1 = Client.create name: 'Test Client', taxnumber: '123456789', bank_id: '123456789'
    @client2 = Client.create name: 'Test Client2', taxnumber: '123456890', bank_id: '123456789'
    @transaction = Transaction.new description: 'transaction1', client: @client1, value: 500.30
  end

  it 'should be valid' do
    expect(@transaction).to be_valid
  end

  it 'should not be valid without a description' do
    @transaction.description = nil
    expect(@transaction).to_not be_valid
  end

  it 'should not be valid without a value' do
    @transaction.value = nil
    expect(@transaction).to_not be_valid
  end

  it 'should not be valid without a client' do
    @transaction.client = nil
    expect(@transaction).to_not be_valid
  end

  it 'should be valid when the value is less than zero' do
    @transaction.value = -5.30
    expect(@transaction).to be_valid
  end

  it 'should not find the transaction of other client' do
    @transaction.save
    found_transaction = Transaction.find_by_client_id(@client2.id)
    expect(found_transaction).to be_nil
  end

end
