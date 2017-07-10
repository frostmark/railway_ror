class TrainsController < ApplicationController
  before_action :authenticate_user!

  def show
    @train = Train.find(params[:id])
  end
end