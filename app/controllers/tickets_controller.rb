class TicketsController < ApplicationController
  before_action :set_train, only: [:new, :create]

  def new
    set_params_or_redirect
    @ticket = Ticket.new
  end

  def create
    @ticket = @train.tickets.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      set_params_or_redirect
      render :new
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_params_or_redirect
    @start_station ||= params.dig(:ticket, :start_station_id)
    @end_station ||= params.dig(:ticket, :end_station_id)
    @route ||= params.dig(:ticket, :route_id)
    @user ||= current_user

    redirect_to :search unless [@start_station, @end_station, @route].all?(&:present?)
  end

  def ticket_params
    params.require(:ticket).permit(
      :name,
      :passport,
      :start_station_id,
      :end_station_id,
      :route_id,
      :user_id
    )
  end
end
