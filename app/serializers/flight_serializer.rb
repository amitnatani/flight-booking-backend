# frozen_string_literal: true

class FlightSerializer < ActiveModel::Serializer
  attributes :id, :source, :destination, :flight_number, :airline_name,
             :departure_time, :arrival_time, :duration_in_minutes, :number_of_stops,
             :price

  def airline_name
    object.airline.name
  end

  def departure_time
    object.departure_time.strftime("%d %b, %Y %H:%M")
  end

  def arrival_time
    object.arrival_time.strftime("%d %b, %Y %H:%M")
  end

  def duration_in_minutes
    ((object.arrival_time - object.departure_time) / 60).to_i
  end

  def number_of_stops
    object.number_of_stops
  end
end
