require "csv"

Product.destroy_all
Category.destroy_all

csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true)

products.each do |product_data|
  title = product_data['name']
  description = product_data['description']
  price = product_data['price'].to_f
  stock_quantity = product_data['quantity'].to_i
  category = product_data['category']

  # Find or create the category
  category = Category.find_or_create_by(name: category)

  # Create the product
  product = Product.create!(
    title: title,
    description: description,
    price: price,
    stock_quantity: stock_quantity,
    category: category
  )
end
