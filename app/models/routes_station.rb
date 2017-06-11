class RoutesStation < ApplicationRecord
  belongs_to :route
  belongs_to :station

  validates :position, uniqueness: { scope: :route_id }
end
