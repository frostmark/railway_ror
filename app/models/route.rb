class Route < ApplicationRecord
  validates :name, presence: true

  has_many :routes_stations
  has_many :stations, -> { order('routes_stations.position') }, through: :routes_stations

  has_many :trains

  private

  def set_name
    self.name = "#{railway_stations.first.name} - #{railway_stations.last.name}"
  end
end
