class V1::TransactionsController < ApplicationController
  def index
    client = Client.find(params[:client_id])
  rescue StandardError => e
    render json: { error: 'Client not found' }, status: :not_found
  else
    client_transactions = client.transactions.group_by(&:created_at).each do |_date, transactions|
      transactions.map! do |transaction|
        {
          description: transaction.description,
          value: transaction.value
        }
      end
    end

    render json: { transactions: client_transactions }, status: :ok
  end
end
