class V1::ClientsController < ApplicationController
  def account_balance
    client = Client.find(params[:client_id])
  rescue StandardError => e
    render json: { error: 'Client not found' }, status: :not_found
  else
    balance = client.balance
    render json: { balance:, at: DateTime.now }, status: :ok
  end
end
