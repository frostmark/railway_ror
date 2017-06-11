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
    atime = hour_and_minutes(params[:station], 'arrive_time')
    dtime = hour_and_minutes(params[:station], 'departure_time')
    station_route(route)&.update(arrive_time: atime, departure_time: dtime)
  end

  protected

  def station_route(route)
    @station_route ||= routes_stations.where(route: route).first
  end

  def hour_and_minutes(params, name)
    params.select { |key| key.include? name }.values.slice(3..4).join(':')
  end
end
