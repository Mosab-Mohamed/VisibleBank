# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


curr = Currency.create(name: "UDS", rate: 1)

c1 = Customer.create(name: "Mosab Muhammad", address: "Address1", email: "mosab@example.com", phone: "87542146545", status: Customer.statuses[:active])
c2 = Customer.create(name: "Muhammad Mosab", address: "Address111", email: "mosab1@example.com", phone: "87542146755", status: Customer.statuses[:active])

acc1 = Account.create(customer_id: c1.id, currency_id: curr.id, account_type: Account.account_types[:basic], balance: 100.0, number: "10005584512879", status: Account.statuses[:active])
acc2 = Account.create(customer_id: c2.id, currency_id: curr.id, account_type: Account.account_types[:basic], balance: 100.0, number: "10005584512878", status: Account.statuses[:active])

Transaction.create(to_account_id: acc2.id, from_account_id: acc1.id, amount: 5, transaction_type: Transaction.transaction_types[:transfer])
Transaction.create(to_account_id: acc2.id, from_account_id: acc1.id, amount: 10, transaction_type: Transaction.transaction_types[:transfer])
Transaction.create(to_account_id: acc1.id, from_account_id: acc2.id, amount: 25, transaction_type: Transaction.transaction_types[:transfer])