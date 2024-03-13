class FlightService
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def data
    flights = Flight.where(query)
    flights = flights.where("date(departure_time) = ?", params[:travel_date])
    flights = flights.where("date(arrival_time) = ?", params[:return_date]) if params[:return_date].present?
    data = ActiveModel::Serializer::CollectionSerializer.new(flights, serializer: FlightSerializer)
    {
      flights: data,
      search_results: flights.count
    }
  end

  private
  def query
    {
      source: params[:source],
      destination: params[:destination],
    }
  end
end