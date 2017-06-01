class Carriage < ApplicationRecord
  ALLOWED_TYPES = [
    'CoupeCarriage',
    'EconomCarriage',
    'SedentaryCarriage',
    'SleepingCarriage'
  ].freeze

  SEATS_TYPES = {
    coupe_carriage: [:top_seats, :low_seats],
    econom_carriage: [:top_seats, :low_seats, :side_top_seats, :side_low_seats],
    sleeping_carriage: [:low_seats],
    sedentary_carriage: [:sedentary_seats]
  }.freeze

  belongs_to :train

  validates :number, uniqueness: { scope: :train_id }
  validates :top_seats, :low_seats, :side_top_seats, :side_low_seats, :sedentary_seats, inclusion: 0..50

  before_validation :set_number

  def seats
    SEATS_TYPES[self.class.name.underscore.to_sym]
  end

  def self.allowed_types
    ALLOWED_TYPES
  end

  protected

  def set_number
    self.number = max_number + 1
  end

  def max_number
    self.train.carriages.maximum(:number) || 0
  end
end
