json.transactions @transactions do |transaction|
  json.id transaction.id
  json.to transaction.to_account
  json.from transaction.from_account
  json.amount transaction.amount
  json.description transaction.description
  json.type transaction.transaction_type
  json.created_at transaction.created_at
end
