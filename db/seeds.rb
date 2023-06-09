require "open-uri"

User.destroy_all
Restroom.destroy_all

User.create!(
  email: "user1@example.com",
  password: "123456",
  username: "User 1"
)

User.create!(
  email: "user2@example.com",
  password: "123456",
  username: "User 2"
)

User.create!(
  email: "user3@example.com",
  password: "123456",
  username: "User 3"
)

Restroom.create!(
  name: "Alexanderplatz Restroom",
  address: "Alexanderplatz 1, 10178 Berlin",
  accessibility: true,
  hygiene_products: true,
  baby_friendly: false,
  pricing: 2.50,
  cleanliness: true,
  longitude: 13.4133,
  latitude: 52.5217,
  user_id: User.first.id,
  approved: true
)

Restroom.create!(
  name: "Friedrichstraße Restroom",
  address: "Friedrichstraße 123, 10117 Berlin",
  accessibility: true,
  hygiene_products: true,
  baby_friendly: true,
  pricing: 3.00,
  cleanliness: true,
  longitude: 13.3889,
  latitude: 52.5200,
  user_id: User.second.id,
  approved: true
)

Restroom.create!(
  name: "Potsdamer Platz Restroom",
  address: "Potsdamer Platz 2, 10785 Berlin",
  accessibility: false,
  hygiene_products: false,
  baby_friendly: false,
  pricing: 1.50,
  cleanliness: false,
  longitude: 13.3736,
  latitude: 52.5096,
  user_id: User.first.id,
  approved: false
)

Restroom.create!(
  name: "Unter den Linden Restroom",
  address: "Unter den Linden 77, 10117 Berlin",
  accessibility: true,
  hygiene_products: true,
  baby_friendly: true,
  pricing: 2.00,
  cleanliness: true,
  longitude: 13.3944,
  latitude: 52.5163,
  user_id: User.third.id,
  approved: true
)

Restroom.create!(
  name: "Kurfürstendamm Restroom",
  address: "Kurfürstendamm 220, 10719 Berlin",
  accessibility: true,
  hygiene_products: false,
  baby_friendly: true,
  pricing: 2.50,
  cleanliness: true,
  longitude: 13.3307,
  latitude: 52.5039,
  user_id: User.second.id,
  approved: true
)

Restroom.create!(
  name: "Schlossplatz Restroom",
  address: "Schlossplatz 5, 10178 Berlin",
  accessibility: false,
  hygiene_products: true,
  baby_friendly: false,
  pricing: 1.00,
  cleanliness: false,
  longitude: 13.4023,
  latitude: 52.5173,
  user_id: User.first.id,
  approved: true
)

Restroom.create!(
  name: "Brandenburger Tor Restroom",
  address: "Brandenburger Tor 1, 10117 Berlin",
  accessibility: true,
  hygiene_products: true,
  baby_friendly: true,
  pricing: 2.00,
  cleanliness: true,
  longitude: 13.3777,
  latitude: 52.5163,
  user_id: User.third.id,
  approved: false
)

Restroom.create!(
  name: "Museum Island Restroom",
  address: "Museum Island, 10178 Berlin",
  accessibility: true,
  hygiene_products: false,
  baby_friendly: false,
  pricing: 1.50,
  cleanliness: true,
  longitude: 13.3986,
  latitude: 52.5199,
  user_id: User.second.id,
  approved: true
)

Restroom.create!(
  name: "Gendarmenmarkt Restroom",
  address: "Gendarmenmarkt, 10117 Berlin",
  accessibility: true,
  hygiene_products: true,
  baby_friendly: true,
  pricing: 3.00,
  cleanliness: true,
  longitude: 13.3928,
  latitude: 52.5139,
  user_id: User.first.id,
  approved: true
)

User.create!(
  email: "user1@example.com",
  password: "123456",
  username: "User 1"
)

User.create!(
  email: "user2@example.com",
  password: "123456",
  username: "User 2"
)

User.create!(
  email: "user3@example.com",
  password: "123456",
  username: "User 3"
)

Restroom.create!(
  name: "Alexanderplatz Restroom",
  address: "Alexanderplatz 1, 10178 Berlin",
  accessibility: true,
  hygiene_products: true,
  baby_friendly: false,
  pricing: 2.50,
  cleanliness: true,
  longitude: 13.4133,
  latitude: 52.5217,
  user_id: User.first.id,
  approved: true
)

Restroom.create!(
  name: "Friedrichstraße Restroom",
  address: "Friedrichstraße 123, 10117 Berlin",
  accessibility: true,
  hygiene_products: true,
  baby_friendly: true,
  pricing: 3.00,
  cleanliness: true,
  longitude: 13.3889,
  latitude: 52.5200,
  user_id: User.second.id,
  approved: true
)

Restroom.create!(
  name: "Potsdamer Platz Restroom",
  address: "Potsdamer Platz 2, 10785 Berlin",
  accessibility: false,
  hygiene_products: false,
  baby_friendly: false,
  pricing: 1.50,
  cleanliness: false,
  longitude: 13.3736,
  latitude: 52.5096,
  user_id: User.first.id,
  approved: false
)

Restroom.create!(
  name: "Unter den Linden Restroom",
  address: "Unter den Linden 77, 10117 Berlin",
  accessibility: true,
  hygiene_products: true,
  baby_friendly: true,
  pricing: 2.00,
  cleanliness: true,
  longitude: 13.3944,
  latitude: 52.5163,
  user_id: User.third.id,
  approved: true
)

Restroom.create!(
  name: "Kurfürstendamm Restroom",
  address: "Kurfürstendamm 220, 10719 Berlin",
  accessibility: true,
  hygiene_products: false,
  baby_friendly: true,
  pricing: 2.50,
  cleanliness: true,
  longitude: 13.3307,
  latitude: 52.5039,
  user_id: User.second.id,
  approved: true
)

Restroom.create!(
  name: "Schlossplatz Restroom",
  address: "Schlossplatz 5, 10178 Berlin",
  accessibility: false,
  hygiene_products: true,
  baby_friendly: false,
  pricing: 1.00,
  cleanliness: false,
  longitude: 13.4023,
  latitude: 52.5173,
  user_id: User.first.id,
  approved: true
)

Restroom.create!(
  name: "Brandenburger Tor Restroom",
  address: "Brandenburger Tor 1, 10117 Berlin",
  accessibility: true,
  hygiene_products: true,
  baby_friendly: true,
  pricing: 2.00,
  cleanliness: true,
  longitude: 13.3777,
  latitude: 52.5163,
  user_id: User.third.id,
  approved: false
)

Restroom.create!(
  name: "Museum Island Restroom",
  address: "Museum Island, 10178 Berlin",
  accessibility: true,
  hygiene_products: false,
  baby_friendly: false,
  pricing: 1.50,
  cleanliness: true,
  longitude: 13.3986,
  latitude: 52.5199,
  user_id: User.second.id,
  approved: true
)

Restroom.create!(
  name: "Gendarmenmarkt Restroom",
  address: "Gendarmenmarkt, 10117 Berlin",
  accessibility: true,
  hygiene_products: true,
  baby_friendly: true,
  pricing: 3.00,
  cleanliness: true,
  longitude: 13.3928,
  latitude: 52.5139,
  user_id: User.first.id,
  approved: true
)