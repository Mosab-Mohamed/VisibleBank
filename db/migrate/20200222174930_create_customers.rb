class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.string :status, null: false, default: 'draft'

      t.timestamps
    end
    add_index :customers, :phone, unique: true
    add_index :customers, :email, unique: true
  end
end
