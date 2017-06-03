class SedentaryCarriage < Carriage
  self.seats = [:sedentary_seats].freeze

  validates :sedentary_seats, inclusion: 0..50
end
