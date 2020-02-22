class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :to_customer, foreign_key: true
      t.references :to_account, foreign_key: true
      t.references :from_customer, foreign_key: true
      t.references :from_account, foreign_key: true, null: true
      t.decimal :amount, precision: 30, scale: 10, null: false
      t.string :transaction_type, null: false
      t.string :description

      t.timestamps
    end
  end
end
