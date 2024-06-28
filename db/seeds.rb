maker1 = Maker.create(name: "コクヨ")
maker2 = Maker.create(name: "ぺんてる")

customer1 = Customer.create(first_name:"田中", last_name:"太郎", first_name_kana: "タナカ", last_name_kana:"タロウ" ,
    organization: "組織1",  email:"customer@example.com", password:"password", password_confirmation:"password")

99.times do |n|
    product1 = Product.create(maker:maker1, name:"せいひん1", jancode:1000000000001, product_code:"b", price:3, unit:"個", note:"bbb")
    order1 = Order.create(customer:customer1, order_date: Time.zone.now, status:1, total_price: 1000)
    OrderDetail.create(order: order1, product: product1, quantity: 2)
end

User.create(first_name:"田中", last_name:"太郎", first_name_kana: "タナカ", last_name_kana:"タロウ" , email:"user@example.com",
    password:"password", password_confirmation:"password")