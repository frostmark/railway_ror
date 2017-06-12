class Station < ApplicationRecord
  validates :name, presence: true

  has_many :routes_stations
  has_many :routes, through: :routes_stations

  has_many :trains, foreign_key: :current_station_id

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end

  def position_in(route)
    station_route(route)&.position
  end

  def arrive_time_in(route)
    station_route(route)&.arrive_time
  end

  def departure_time_in(route)
    station_route(route)&.departure_time
  end

  def update_time(route, params)
    station_route(route)&.update(arrive_time: params[:arrive_time], departure_time: params[:departure_time])
  end

  protected

  def station_route(route)
    @station_route ||= routes_stations.where(route: route).first
  end
end
