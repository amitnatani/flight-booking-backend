class Flight < ApplicationRecord
  belongs_to :airline

  validates_presence_of :source, :destination, :flight_number, :departure_time, :arrival_time, :price
end
