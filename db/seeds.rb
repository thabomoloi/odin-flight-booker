# seeds.rb
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

cpt = Airport.find_or_create_by!(code: "CPT")
jnb = Airport.find_or_create_by!(code: "JNB")
bfn = Airport.find_or_create_by!(code: "BFN")
hla = Airport.find_or_create_by!(code: "HLA")
dur = Airport.find_or_create_by!(code: "DUR")

Flight.create!(
  departure_airport: cpt,
  arrival_airport: jnb,
  departure_time: "2024-06-10 08:00:00",
  duration: 120
)

Flight.create!(
  departure_airport: jnb,
  arrival_airport: cpt,
  departure_time: "2024-06-10 10:00:00",
  duration: 120
)

Flight.create!(
  departure_airport: jnb,
  arrival_airport: dur,
  departure_time: "2024-06-10 09:00:00",
  duration: 90
)

Flight.create!(
  departure_airport: bfn,
  arrival_airport: hla,
  departure_time: "2024-06-10 10:00:00",
  duration: 60
)

Flight.create!(
  departure_airport: hla,
  arrival_airport: cpt,
  departure_time: "2024-06-10 11:00:00",
  duration: 150
)

Flight.create!(
  departure_airport: dur,
  arrival_airport: bfn,
  departure_time: "2024-06-10 12:00:00",
  duration: 80
)
