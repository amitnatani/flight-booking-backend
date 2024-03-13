class FlightsController < ApplicationController
  before_action :set_current_user
  def search
    data = FlightService.new(params).data
    render json: data, status: 200
  end
end
