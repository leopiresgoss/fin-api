class V1::ClientsController < ApplicationController
  def account_balance
    begin
      client = Client.find(params[:client_id])
    rescue => exception
      render json: { error: 'Client not found' }, status: :not_found
    else
      balance = client.balance
      render json: { balance: balance, at: DateTime.now }, status: :ok
    end
  end
end