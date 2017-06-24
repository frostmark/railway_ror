class Admin::TicketsController < ApplicationController
  before_action :set_train, only: []

  def index
    @tickets = Ticket.all
  end

  def new

  end

  def show

  end

  def edit

  end
end
