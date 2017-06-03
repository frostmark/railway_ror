class SleepingCarriage < Carriage
  self.seats = [:low_seats].freeze

  validates :low_seats, inclusion: 0..50
end
