require 'rails_helper'

RSpec.describe Client, type: :model do
  before do
    @client = Client.new name: 'Test Client', taxnumber: '123456789', bank_id: '123456789'
  end

  it 'should be valid' do
    expect(@client).to be_valid
  end

  it 'should not be valid without a name' do
    @client.name = nil
    expect(@client).to_not be_valid
  end

  it 'should not be valid without a taxnumber' do
    @client.taxnumber = nil
    expect(@client).to_not be_valid
  end

  it 'should not be valid without a bank_id' do
    @client.bank_id = nil
    expect(@client).to_not be_valid
  end
end
