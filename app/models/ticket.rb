class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user
  belongs_to :start_station, class_name: 'Station', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'Station', foreign_key: :end_station_id
  belongs_to :route

  after_create :buy_notify

  def buy_notify
    TicketMailer.ticket_buy_notify(user, self).deliver_now
  end
end
