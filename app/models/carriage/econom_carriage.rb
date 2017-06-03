class EconomCarriage < Carriage
  self.seats = [:top_seats, :low_seats, :side_top_seats, :side_low_seats].freeze

  validates :top_seats, :low_seats, :side_top_seats, :side_low_seats, inclusion: 0..50
end
