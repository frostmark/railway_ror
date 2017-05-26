class Carriage < ApplicationRecord
  enum kind: [:coupe, :seat]

  belongs_to :train

  validates :top_seats, :low_seats, inclusion: 0..50

  validates :kind, inclusion: { in: kinds }

  scope :count_by_kind, ->(kind) { where(kind: kind).count }

  scope :count_seats_by_kind, ->(kind, position) { where(kind: kind).map(&position).reduce(:+) }
end
