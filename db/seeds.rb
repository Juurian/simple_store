require "faker"

676.times do
  Product.create(
    title:          Faker::Commerce.product_name,
    description:    Faker::Lorem.paragraph,
    price:          Faker::Commerce.price(range: 0..1000.0, as_string: false),
    stock_quantity: Faker::Number.between(from: 1, to: 100)
  )
end
