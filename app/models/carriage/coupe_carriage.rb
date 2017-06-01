class CoupeCarriage < Carriage
  validates :top_seats, :low_seats, inclusion: 0..50
end
