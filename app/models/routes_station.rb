class RoutesStation < ApplicationRecord
  belongs_to :route
  belongs_to :station

  validates_uniqueness_of :order, scope: :station_id
end
