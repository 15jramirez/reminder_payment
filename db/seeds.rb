user_one = User.create(username:"user", password:"122")
payment_one = Payment.create(name: "hulu", amount:12.55, description:"have to pay monthly on this bill",due_date: "12/12/2020")

user_two = User.create(username:"u", password:"12")
payment_two= Payment.create(name: "candy", amount:1.25, description:"total candy spent for the week", due_date: "12/12/2011")
payment_three= Payment.create(name: "amazon credit card", amount:222.80, description:"montly expense. plan to pay half this month",due_date: 12/26/2020)