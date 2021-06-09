# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

########## Delete All ##########
Item.destroy_all
Cart.destroy_all
JointItemsOrder.destroy_all
User.destroy_all
Order.destroy_all
JointItemsCart.destroy_all

########## Create 10 items ########
10.times do |i|
  Item.create!(
    title: Faker::Creature::Cat.name,
    description: Faker::Lorem.sentence(word_count: rand(20..40)),
    price: Faker::Number.decimal(l_digits: 2),
    image_url: Faker::LoremFlickr.image(size: "200x200", search_terms: ["cat"]),
  )
  puts "#{i} item(s) created"
  puts "*" * (i + 1)
end

########## Create 20 users ########
20.times do |i|
  User.create!(
    first_name:Faker::Games::Zelda.character,
    last_name:Faker::JapaneseMedia::DragonBall.race,
    email: Faker::Internet.email,
    password: "foobar",
    password_confirmation: "foobar",
  )
  puts "#{i} user(s) created and carts"
  puts "*" * (i + 1)
end

########## Create 20 orders & with random items ########
10.times do |i|
  Order.create(
    user_id: User.all.sample.id,
  )
  puts "#{i} order(s) created"
  puts "*" * (i + 1)
end
50.times do |i|
  JointItemsOrder.create(
    order_id: Order.all.sample.id,
    item_id: Item.all.sample.id,
  )
end

########## Create 3  joint item cart ########

3.times do |i|
  c = Cart.all.sample
  item = Item.all.sample
  JointItemsCart.create!(
    cart_id: c.id,
    item_id: item.id,
  )
  puts "#{i} joint_item_cart table created"
  puts "*" * (i + 1)
end

puts 'Well done ☢︎ , the seed it\'s OK 🎉 🎉 '