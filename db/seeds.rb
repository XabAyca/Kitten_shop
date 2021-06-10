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

cat1 = Item.create(title:'Félix',description:'Félix le Chat est un personnage de dessin animé américain de la période des films muets, créé par Otto Messmer et Pat Sullivan. Il est un chat tuxedo noir et blanc anthropomorphe.',price:125.99,image_url:'https://images.pexels.com/photos/774731/pexels-photo-774731.jpeg?cs=srgb&dl=pexels-marko-blazevic-774731.jpg&fm=jpg')

puts "***************************"
puts "1 items created ==> #{cat1.title}"

cat2 = Item.create(title:'Tom',description:'Tom est un chat domestique bleu horizon, ou gris selon les épisodes, anthropomorphe habituellement caractérisé par une attitude gourmande et paresseuse. ...',price:99.99,image_url:'https://images.pexels.com/photos/1741205/pexels-photo-1741205.jpeg?cs=srgb&dl=pexels-lina-kivaka-1741205.jpg&fm=jpg')

puts "***************************"
puts "1 items created ==> #{cat2.title}"

cat3 = Item.create(title:'Henry',description:"Henri IV , dit « le Grand » ou « le Vert galant », né sous le nom d'Henri de Bourbon le 13 décembre 1553 à Pau et mort assassiné le 14 mai 1610 à Paris",price:999.99,image_url:'https://images.pexels.com/photos/1056251/pexels-photo-1056251.jpeg?cs=srgb&dl=pexels-ihsan-aditya-1056251.jpg&fm=jpg')

puts "***************************"
puts "1 items created ==> #{cat3.title}"

cat4 = Item.create(title:'Hannibal',description:"Hannibal Lecter est un tueur en série créé par le romancier Thomas Harris. ... Ancien psychiatre, évadé d'un asile psychiatrique où il était interné pour divers meurtres et actes de cannibalisme",price:19.99,image_url:'https://images.pexels.com/photos/821736/pexels-photo-821736.jpeg?cs=srgb&dl=pexels-alex-andrews-821736.jpg&fm=jpg')

puts "***************************"
puts "1 items created ==> #{cat4.title}"

puts "***************************"
puts 'Well done ☢︎ , the seed it\'s OK 🎉 🎉 '