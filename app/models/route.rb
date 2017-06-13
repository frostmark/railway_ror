class Route < ApplicationRecord
  validates :name, presence: true

  has_many :routes_stations
  has_many :stations, -> { order('routes_stations.position') }, through: :routes_stations

  has_many :trains

  scope :with_station, ->(id) { includes(:routes_stations).where(routes_stations: { station_id: id }) }

  def self.by_stations(start_st, end_st)
    with_start_station = with_station(start_st)
    with_end_station = with_station(end_st)
    routes = with_start_station & with_end_station

    routes.select do |r|
      start_station_number = r.routes_stations.find_by(station_id: start_st).try(:position)
      end_station_number = r.routes_stations.find_by(station_id: end_st).try(:position)

      if start_station_number && end_station_number
        start_station_number.to_i < end_station_number.to_i
      end
    end
  end

  private

  def set_name
    self.name = "#{railway_stations.first.name} - #{railway_stations.last.name}"
  end
end
