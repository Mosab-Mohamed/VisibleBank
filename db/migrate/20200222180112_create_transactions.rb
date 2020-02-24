class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :to_account, foreign_key: false
      t.references :from_account, foreign_key: false
      t.decimal :amount, precision: 30, scale: 10, null: false
      t.string :transaction_type, null: false
      t.string :description

      t.timestamps
    end

    add_foreign_key :to_account_transactions, :accounts, column: :to_account
    add_foreign_key :from_account_transactions, :accounts, column: :from_account
  end
end
