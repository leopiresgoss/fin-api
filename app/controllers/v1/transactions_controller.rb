module V1
  class TransactionsController < ApplicationController
    def index
      client = Client.find(params[:client_id])
    rescue StandardError => e
      render json: { error: 'Client not found' }, status: :not_found
    else
      start_date = params[:from]
      end_date = params[:to]
      client_transactions = client.transactions
                                  .where(created_at: start_date..end_date)
                                  .group_by(&:created_at)
                                  .each do |_date, transactions|
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
end
