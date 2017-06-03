class RoutesStation < ApplicationRecord
  belongs_to :route
  belongs_to :station

  validates :order, uniqueness: { scope: :station_id }
end
