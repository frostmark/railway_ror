class Route < ApplicationRecord
  validates :name, presence: true

  has_many :routes_stations
  has_many :stations, through: :routes_stations

  has_many :trains
end
