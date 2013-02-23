# this is for populating with large number of orders so we can test pagination

Order.transaction do
  (1..100).each do |i|
    Order.create(name: "Customer #{i}", address: "#{i} Main Street",
      email: "customer-#{i}@example.com", pay_type: "Check")
  end
end
