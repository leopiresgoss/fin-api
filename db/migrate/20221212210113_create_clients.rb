class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :taxnumber
      t.string :bank_id

      t.timestamps
    end
  end
end
