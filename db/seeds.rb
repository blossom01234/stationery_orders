maker1 = Maker.create(name: "コクヨ")
maker2 = Maker.create(name: "ぺんてる")

Product.create(maker:maker1, name:"せいひん1", jancode:1, product_code:"b", price:3, unit:"個", note:"bbb")

customer1 = Customer.create(first_name:"田中", last_name:"太郎", first_name_kana: "タナカ", last_name_kana:"タロウ" , \
organization: "組織1",  email:"example@example.com")

Order.create(customer:customer1, order_date: Time.zone.now, status:1, total_price: 1000)