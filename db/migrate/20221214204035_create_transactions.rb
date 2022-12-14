class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :description
      t.float :value

      t.timestamps
    end

    add_reference :transactions, :client, foreign_key: true
  end
end
