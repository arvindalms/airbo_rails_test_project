

customers = Customer.create([{ first_name: 'Johny',last_name: 'Flow' }, { first_name: 'Raj',last_name: 'Jamnis' }, { first_name: 'Andrew',last_name: 'Chung' }, { first_name: 'Mike',last_name: 'Smith' }])
customers.each do | single_customer |
  case single_customer.id
  when 1    
    successful = 5
    failed = 0
    disputed = 3
  when 2    
  	successful = 3
    failed = 0
    disputed = 2
  when 3
  	successful = 1
    failed = 3
    disputed = 0
  else
  	successful = 1
    failed = 2
    disputed = 0
  end
  successful.times do |i|
  	CreditCard.create(paid: true, refunded: false, amount: '4900', currency: 'usd' , customer: single_customer )
  end
  failed.times do |i|
  	CreditCard.create(paid: false, refunded: false, amount: '4900', currency: 'usd' , customer: single_customer )
  end
  disputed.times do |i|
  	CreditCard.create(paid: true, refunded: true, amount: '4900', currency: 'usd' , customer: single_customer )
  end
end
