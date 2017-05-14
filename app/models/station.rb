class Station < ApplicationRecord
  validates :name, presence: true

  has_many :routes_stations
  has_many :routes, through: :routes_stations

  has_many :trains, foreign_key: :current_station_id
end
