user = User.create(email: Faker::Internet.email, password: Faker::Internet.password(10, 20))

10.times do
    user = User.create(email: Faker::Internet.email, password: Faker::Internet.password(10, 20))


    cart = Cart.new
    cart.user = user
    cart.save

    order = Order.new
    order.user = user
    order.save


    line_item = LineItem.create(quantity: Faker::Number.number(4))
    line_item.cart = cart
    line_item.save

    category = Category.create(title: Faker::Commerce.department)


    item = Item.create(title: Faker::Commerce.product_name, price: Faker::Commerce.price, inventory: Faker::Number.number(3))
    item.category = category
    item.save

end



counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end
