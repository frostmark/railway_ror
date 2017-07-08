class TicketMailer < ApplicationMailer
  def ticket_buy_notify(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: @user.email, subject: 'New ticket')
  end
end
