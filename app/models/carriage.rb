class Carriage < ApplicationRecord
  enum kind: [:coupe, :seat]

  belongs_to :train

  validates :top_seats, :low_seats, inclusion: 0..50

  validates :kind, inclusion: { in: kinds }
end
