# frozen_string_literal: true

FactoryBot.define do
  factory :flight do
    source { 'Jaipur' }
    destination { 'Mumbai' }
    departure_time { Time.now + 2.hours }
    arrival_time { Time.now + 4.hours }
    flight_number { 'A1234' }
    airline
    price { 10000 }
  end
end
