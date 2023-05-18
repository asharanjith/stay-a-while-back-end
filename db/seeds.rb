# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@user = User.create(name: "admin@3453$")

home_stay1= HomeStay.create(
  name: "Cottage by Maxwell",
    location: "Sao Paulo, Brazil",
    description: "A house, built of a wooden base, brick, and glass is surrounded by a green field of 5000 m2 where, over the last 20 years,  it has being planted various species of fruit trees and ornamental plants.",
    no_of_rooms: 3,
    rating: 3,
    price: 150,
    user: @user
  )  
   
Image.create(url: "https://images.pexels.com/photos/2102587/pexels-photo-2102587.jpeg?auto=compress&cs=tinysrgb&w=600", home_stay: home_stay1)

Image.create(url: "https://images.pexels.com/photos/1428348/pexels-photo-1428348.jpeg?auto=compress&cs=tinysrgb&w=600", home_stay: home_stay1)

Image.create(url: "https://images.pexels.com/photos/2179214/pexels-photo-2179214.jpeg?auto=compress&cs=tinysrgb&w=600", home_stay: home_stay1)

Image.create(url: "https://images.pexels.com/photos/2346091/pexels-photo-2346091.jpeg?auto=compress&cs=tinysrgb&w=600", home_stay: home_stay1)

Image.create(url: "https://images.pexels.com/photos/1571450/pexels-photo-1571450.jpeg?auto=compress&cs=tinysrgb&w=600", home_stay: home_stay1)

#Home 2

home_stay2= HomeStay.create(
name: "Stay with Jen",
  location: "Kuta Utara, Indonesia",
  description: "Beyond Bungalows is a chic and romantic accommodation located in the happenings of Canggu. The location offers the tranquil and traditional ambiance of Bali. Your bungalow is one of our 7 units. It comes with one 180cm*200cm king bed, 5 star mattress, high quality bed linen, an exotic outdoor shower area, a wardrobe, and it is equipped with AC and fan.",
  no_of_rooms: 3,
  rating: 4,
  price: 250,
  user: @user
) 
 
Image.create(url: "https://images.pexels.com/photos/2360673/pexels-photo-2360673.jpeg?auto=compress&cs=tinysrgb&w=600", home_stay: home_stay2)

Image.create(url: "https://images.pexels.com/photos/1428348/pexels-photo-1428348.jpeg?auto=compress&cs=tinysrgb&w=600", home_stay: home_stay2)

Image.create(url: "https://images.pexels.com/photos/189333/pexels-photo-189333.jpeg?auto=compress&cs=tinysrgb&w=600", home_stay: home_stay2)

Image.create(url: "https://images.pexels.com/photos/1879061/pexels-photo-1879061.jpeg?auto=compress&cs=tinysrgb&w=600", home_stay: home_stay2)

Image.create(url: "https://images.pexels.com/photos/105934/pexels-photo-105934.jpeg?auto=compress&cs=tinysrgb&w=600", home_stay: home_stay2)

#Home 3

home_stay3= HomeStay.create(
name: "Home by Sam",
  location: "Mtskheta-Mtianeti, Georgia",
  description: "Peaceful Place, comfortable environment for relaxation.
Huge Beautiful yard space, panoramic balcony views. separate from Cars noisy. comfortable kitchen and dinner place on the first floor. We have private 4 rooms for 12 guests. with private balconies. our house is renting also fully for families, couples, and friends. inside is new furniture, a comfortable space, and all technics of the kitchen and house. outside is barbecue space and equipment",
  no_of_rooms: 5,
  rating: 4,
  price: 175,
  user: @user
)  
 
Image.create(url: "https://images.pexels.com/photos/259588/pexels-photo-259588.jpeg?auto=compress&cs=tinysrgb&w=600", home_stay: home_stay3)

Image.create(url: "https://images.pexels.com/photos/2029731/pexels-photo-2029731.jpeg?auto=compress&cs=tinysrgb&w=600", home_stay: home_stay3)

Image.create(url: "https://images.pexels.com/photos/2988865/pexels-photo-2988865.jpeg?auto=compress&cs=tinysrgb&w=600", home_stay: home_stay3)

Image.create(url: "https://images.pexels.com/photos/4740488/pexels-photo-4740488.jpeg?auto=compress&cs=tinysrgb&w=600", home_stay: home_stay3)

Image.create(url: "https://images.pexels.com/photos/1571458/pexels-photo-1571458.jpeg?auto=compress&cs=tinysrgb&w=600", home_stay: home_stay3)

#Home 4

home_stay4= HomeStay.create(
name: "Condo by Alessi",
  location: "Milano, Italy",
  description: "Lovely room in a Victorian house with a delightful garden. In a quiet location, perfect for relaxing and enjoying Hackney, with green spaces, cafes, and restaurants. There is a new bathroom with a shower and skylight.The kitchen has a large fridge freezer, oven, and dishwasher.It is quiet yet close to the action.",
  no_of_rooms: 6,
  rating: 3,
  price: 375,
  user: @user
)  
 
Image.create(url: "https://images.pexels.com/photos/1438832/pexels-photo-1438832.jpeg?auto=compress&cs=tinysrgb&w=600", home_stay: home_stay4)

Image.create(url: "https://images.pexels.com/photos/1648776/pexels-photo-1648776.jpeg?auto=compress&cs=tinysrgb&w=600", home_stay: home_stay4)

Image.create(url: "https://images.pexels.com/photos/3555618/pexels-photo-3555618.jpeg?auto=compress&cs=tinysrgb&w=600", home_stay: home_stay4)

Image.create(url: "https://images.pexels.com/photos/2029719/pexels-photo-2029719.jpeg?auto=compress&cs=tinysrgb&w=600", home_stay: home_stay4)

Image.create(url: "https://images.pexels.com/photos/271631/pexels-photo-271631.jpeg?auto=compress&cs=tinysrgb&w=600", home_stay: home_stay4)

#Home 5

home_stay5= HomeStay.create(
name: "Garden Home by Mario",
  location: "Johannesburg, South Africa",
  description: "Central room above the city. The room is bright, has its own balcony (the perfect place to enjoy the sunset), and is well-suited for
anyone looking for an affordable and decent place to stay. Guests will have access to the pool, outdoor dining and barbecue area, sports facility, and coin-operated laundry. Guests can reach me on my cell in case of emergencies.",
  no_of_rooms: 5,
  rating: 4,
  price: 400,
  user: @user
)  
 
Image.create(url: "https://images.pexels.com/photos/280222/pexels-photo-280222.jpeg?auto=compress&cs=tinysrgb&w=600", home_stay: home_stay5)

Image.create(url: "https://images.pexels.com/photos/3705529/pexels-photo-3705529.jpeg?auto=compress&cs=tinysrgb&w=600", home_stay: home_stay5)

Image.create(url: "https://images.pexels.com/photos/90317/pexels-photo-90317.jpeg?auto=compress&cs=tinysrgb&w=600", home_stay: home_stay5)

Image.create(url: "https://images.pexels.com/photos/1743229/pexels-photo-1743229.jpeg?auto=compress&cs=tinysrgb&w=600", home_stay: home_stay5)

Image.create(url: "https://images.pexels.com/photos/3316926/pexels-photo-3316926.jpeg?auto=compress&cs=tinysrgb&w=600", home_stay: home_stay5)

