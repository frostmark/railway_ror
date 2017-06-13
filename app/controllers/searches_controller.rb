class SearchesController < ApplicationController
  def show
    @stations = Station.all
    @start_station = params.dig(:search, :from)
    @end_station = params.dig(:search, :to)

    @routes = Route.by_stations(@start_station, @end_station)
  end
end
