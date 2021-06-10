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

cat1 = Item.create(title:'Félix',description:'Félix le Chat est un personnage de dessin animé américain de la période des films muets, créé par Otto Messmer et Pat Sullivan. Il est un chat tuxedo noir et blanc anthropomorphe.',price:125.99,image_url:'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.fr%2Fpin%2F455637687280178043%2F&psig=AOvVaw36WZKqDlk2NYSJFV1enYdg&ust=1623416632064000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCJiaqbGQjfECFQAAAAAdAAAAABAI')

puts "***************************"
puts "1 items created ==> #{cat1.title}"

cat2 = Item.create(title:'Tom',description:'Tom est un chat domestique bleu horizon, ou gris selon les épisodes, anthropomorphe habituellement caractérisé par une attitude gourmande et paresseuse. ...',price:99.99,image_url:'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.zooplus.fr%2Fmagazine%2Fchat%2Fadopter-un-chat%2Fchat-abandonne-que-faire&psig=AOvVaw36WZKqDlk2NYSJFV1enYdg&ust=1623416632064000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCJiaqbGQjfECFQAAAAAdAAAAABAN')

puts "***************************"
puts "1 items created ==> #{cat2.title}"

cat3 = Item.create(title:'Henry',description:"Henri IV , dit « le Grand » ou « le Vert galant », né sous le nom d'Henri de Bourbon le 13 décembre 1553 à Pau et mort assassiné le 14 mai 1610 à Paris",price:999.99,image_url:'https://www.google.com/url?sa=i&url=https%3A%2F%2Frisibank.fr%2Fstickers%2F98018-other-chat-roi-royal&psig=AOvVaw2ptW_cZI17Vv_B5FFJMLd2&ust=1623416956706000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCJCzkMuRjfECFQAAAAAdAAAAABAO')

puts "***************************"
puts "1 items created ==> #{cat3.title}"

cat4 = Item.create(title:'Hannibal',description:"Hannibal Lecter est un tueur en série créé par le romancier Thomas Harris. ... Ancien psychiatre, évadé d'un asile psychiatrique où il était interné pour divers meurtres et actes de cannibalisme",price:19.99,image_url:'https://www.google.com/url?sa=i&url=https%3A%2F%2Fmyanimals.com%2Ffr%2Fsante%2Fbien-etre-et-soins%2Fconseils%2Fde-quoi-ont-peur-les-chats%2F&psig=AOvVaw1kzDfkso7oEIGCejrei26q&ust=1623417006484000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLjunOSRjfECFQAAAAAdAAAAABAD')

puts "***************************"
puts "1 items created ==> #{cat4.title}"

puts "***************************"
puts 'Well done ☢︎ , the seed it\'s OK 🎉 🎉 '