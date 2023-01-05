require 'rails_helper'

RSpec.describe V1::ClientsController, type: :request do
  before do
    @client1 = Client.create name: 'Test Client', taxnumber: '123456789', bank_id: '123456789'
    Transaction.create description: 'transaction1', client: @client1, value: 500.30, created_at: Date.today - 1.day
    Transaction.create description: 'transaction2', client: @client1, value: -400.60, created_at: Date.today - 1.day
    Transaction.create description: 'transaction3', client: @client1, value: 10.20, created_at: Date.today - 2.days
  end

  describe 'GET clients/:id/transactions' do
    it 'should have 200 http status' do
      get v1_client_transactions_path(@client1.id)
      expect(response).to have_http_status(200)
    end

    it 'should return the transactions of the client' do
      get v1_client_transactions_path(@client1.id)
      expect(JSON.parse(response.body)).to eq({
                                                'transactions' => {
                                                  "#{Time.zone.parse((Date.today - 1.day).to_s)}" => [{
                                                    'description' => 'transaction1',
                                                    'value' => 500.30
                                                  }, {
                                                    'description' => 'transaction2',
                                                    'value' => -400.60
                                                  }],
                                                  "#{Time.zone.parse((Date.today - 2.days).to_s)}" => [{
                                                    'description' => 'transaction3',
                                                    'value' => 10.20
                                                  }]
                                                }
                                              })
    end

    it 'should return 404 http status if client not found' do
      get v1_client_transactions_path(999)
      expect(response).to have_http_status(404)
    end
  end
end
