json.customer @customers do |customer|
  json.id customer.id
  json.name customer.name
  json.address customer.address
  json.email customer.email
  json.phone customer.phone
  json.status customer.status
end
