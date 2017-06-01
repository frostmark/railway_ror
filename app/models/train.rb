class Train < ApplicationRecord
  has_many :tickets
  has_many :carriages, ->(train) { order(number: train.from_head ? :asc : :desc) }

  belongs_to :route, optional: true
  belongs_to :current_station, class_name: 'Station', foreign_key: :current_station_id, optional: true

  def find_seats(type, arg)
    carriages.where(type: type).sum(arg)
  end
end
