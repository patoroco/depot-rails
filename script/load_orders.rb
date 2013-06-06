Order.transaction do
  (1..100).each do |i|
    Order.create(name: "Customer #{i}",
                 address: "#{i} Main Street",
                 email: "user#{i}@google.com",
                 pay_type: "Check")
  end
end