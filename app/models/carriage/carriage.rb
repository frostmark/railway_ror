class Carriage < ApplicationRecord
  ALLOWED_TYPES = [
    'CoupeCarriage',
    'EconomCarriage',
    'SedentaryCarriage',
    'SleepingCarriage'
  ].freeze

  class_attribute :seats
  self.seats = [].freeze

  belongs_to :train

  validates :number, uniqueness: { scope: :train_id }

  before_validation :set_number

  def self.allowed_types
    ALLOWED_TYPES
  end

  protected

  def set_number
    self.number ||= max_number + 1
  end

  def max_number
    self.train.carriages.maximum(:number) || 0
  end
end
