class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.references :customer, foreign_key: true
      t.references :currency, foreign_key: true
      t.string :account_type, null: false
      t.decimal :balance, precision: 30, scale: 10, null: false
      t.string :number, null: false
      t.string :status, null: false, default: 'draft'

      t.timestamps
    end
    add_index :accounts, :number, unique: true
  end
end
