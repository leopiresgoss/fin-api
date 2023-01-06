require 'rails_helper'

RSpec.describe V1::ClientsController, type: :request do
  before do
    @client1 = Client.create name: 'Test Client', taxnumber: '123456789', bank_id: '123456789'
    Transaction.create description: 'transaction1', client: @client1, value: 500.30
    Transaction.create description: 'transaction2', client: @client1, value: -400.60
  end

  describe 'GET clients/:id/account-balance' do
    it 'should have 200 http status' do
      get v1_client_account_balance_path(@client1.id)
      expect(response).to have_http_status(200)
    end

    it 'should return the correct balance' do
      get v1_client_account_balance_path(@client1.id)

      expect(JSON.parse(response.body)['balance']).to eq(99.70)
      expect(JSON.parse(response.body)['at']).to be_present
    end

    it 'should return 404 if client does not exist' do
      get v1_client_account_balance_path(9999)
      expect(response).to have_http_status(404)
    end
  end
end