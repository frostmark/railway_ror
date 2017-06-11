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

  protected

  def station_route(route)
    @station_route ||= routes_stations.where(route: route).first
  end
end
