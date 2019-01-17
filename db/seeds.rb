brittany = User.create!(user_name: "Brittany", email: "brittanygrebnova@gmail.com", password: "mila2013", street_address: "223 Washburn Ave.", city: "Washington", state: "NJ", balance: 25 )
lana = User.create!(user_name: "Lana", email: "lanagrebnova@gmail.com", password: "bony2015", street_address: "15 Schley Rd.", city: "Far Hills", state: "NJ", balance: 25 )

burrito = Item.create(name: "burrito", price: 8)
tacos = Item.create(name: "tacos", price: 7)
churros = Item.create(name: "churros", price: 6)

mexican_place = Vendor.create!(email: "mexicanplace@gmail.com", password: "mexicanplace", name: "Mexican Place", city: "Washington", state: "NJ", category: "food")
mexican_place.items << [burrito, tacos, churros]

pizza = Item.create(name: "slice a pizza", price: 3)
garlic_knots = Item.create(name: "10 garlic knots", price: 5)
tiramisu = Item.create(name: "tiramisu", price: 4)

italian_place = Vendor.create(email: "italianplace@gmail.com", password: "italianplace", name: "Italian Place", city: "Washington", state: "NJ", category: "food")
italian_place.items << [pizza, garlic_knots, tiramisu]

red_curry = Item.create(name: "red curry", price: 10)
drunken_noodles = Item.create(name: "drunken noodles", price: 12)
coconut_pudding = Item.create(name: "coconut pudding", price: 7)

thai_place = Vendor.create(email: "thaiplace@gmail.com", password: "thaiplace", name: "Thai Place", city: "Far Hills", state: "NJ", category: "food")
thai_place.items << [red_curry, drunken_noodles, coconut_pudding]

first_order = Order.create(user_id: brittany.id, vendor_id: mexican_place.id)
first_order.items << [burrito, churros]

second_order = Order.create(user_id: lana.id, vendor_id: thai_place.id)
second_order.items << [red_curry, coconut_pudding]
