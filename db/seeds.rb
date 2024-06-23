maker1 = Maker.create(name: "コクヨ")
maker2 = Maker.create(name: "ぺんてる")

Product.create(maker:maker1, name:"せいひん1", jancode:1, product_code:"b", price:3, unit:"個", note:"bbb")