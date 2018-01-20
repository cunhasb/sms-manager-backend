# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'byebug'
require 'json'
require 'faker'
# byebug
file =(File.read("./db/gateway.json"))
carriers = JSON.parse(file)
carriers.each do |carrier|
  Carrier.create(carrier)
end

Faker::Config.locale = 'en-US'
# user = User.create(name: Faker::Superhero.name)
# customer = Customer.new(name: Faker::Superhero.name)
# campaign = Campaign.new(name: Faker::FamilyGuy.quote)
# message= Message.new(name:Faker::FamilyGuy.quote)

# byebug
for i in 0..10
  campaign = Campaign.create(name:Faker::HarryPotter.character, user_id:User.all[0].id, unread_messages:0)
  # byebug
  for i in 0..5
    # byebug
    customer = Customer.create(user_id:User.all[0].id, name:Faker::Hobbit.character, email:Faker::Internet.email,phone: Faker::PhoneNumber.cell_phone, unread_messages:2, image_url: Faker::Avatar.image)
    campaign.messages << Message.new(label_ids:"send", message_type:"to_user", name:Faker::HeyArnold.quote, customer_id: customer[:id])
    campaign.messages << Message.new(label_ids:"Promotions", message_type:"from_user",name:Faker::ChuckNorris.fact,customer_id:customer[:id])
    campaign.unread_messages = campaign.unread_messages + 2
    campaign.save
  end
  # for i in 0..2
  #   # byebug
  #   customer = Customer.new(user_id:User.all[0].id, name:Faker::Hobbit.unique.character, email:Faker::Internet.email,phone: Faker::PhoneNumber.cell_phone, unread_messages:0, image_url:Faker::Avatar.unique.Avatar)
  #   campaign.customers << Customer.new(user_id:User.all[0].id, name:Faker::Hobbit.unique.character, email:Faker::Internet.email,phone: Faker::PhoneNumber.cell_phone, unread_messages:0, image_url:Faker::Avatar.unique.Avatar)
  # end
end


# birthday = Campaign.create(name:"Birthday Discount",user_id: 1)
# flash = Campaign.create(name:"Flash Sale",user_id: 1)
# mailing = Campaign.create(name:"Mailing List",user_id: 1)
# subscribe= Message.new(label_ids:"received", name:"subscribe")
# tellmore= Message.new(label_ids:"received", name:"tellMeMore")
# unsubscribe= Message.new(label_ids:"received", name:"unsubscribe")
# message= Message.new(label_ids:"send", name:"Great... reply subscribe to subscribe, unsubscribe to unsubscribe or tell more to get more information")
# birthday.messages << subscribe
# birthday.messages << tellmore
# flash.messages << subscribe
# flash.messages << tellmore
# flash.messages << unsubscribe
# mailing.messages << subscribe
# mailing.messages << unsubscribe
