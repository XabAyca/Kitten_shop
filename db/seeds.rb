# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

########## Delete All ##########
Item.destroy_all
User.destroy_all

########## Create 10 items ########
10.times do |i|
  Item.create!(
    title: Faker::Creature::Cat.name,
    description: Faker::Lorem.sentence(word_count: rand(20..40)),
    price: Faker::Number.decimal(l_digits: 2),
    image_url: Faker::LoremFlickr.image(size: "50x60", search_terms: ["cat"]),
  )
  puts "#{i} item(s) created"
  puts "*" * (i + 1)
end

########## Create 20 users ########
20.times do |i|
  c = Cart.create()
  User.create!(
    email: Faker::Internet.email,
    password: "ang9cbhoa8",
    password_confirmation: "ang9cbhoa8",
    carts_id: c.id,
  )
  puts "#{i} user(s) created and carts"
  puts "*" * (i + 1)
end

puts 'Well done ☢︎ , the seed it\'s OK 🎉 🎉 '

########## Create 3  joint item cart ########

3.times do |i|
  c = Cart.all.sample
  item = Item.all.sample
  p c
  p item
  JointItemsCart.create!(
    cart_id: c.id,
    item_id: item.id,
  )
  puts "#{i} joint_item_cart table created"
  puts "*" * (i + 1)
end
