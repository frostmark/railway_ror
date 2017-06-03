class CoupeCarriage < Carriage
  self.seats = [:top_seats, :low_seats].freeze

  validates :top_seats, :low_seats, inclusion: 0..50
end
