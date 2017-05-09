class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  def index
    @routes = Route.all
  end

  def new
    @route = Route.new
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @route.update(route_params)
        format.html { redirect_to @route, notice: 'Route was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def create
    @route = Route.new(route_params)

    respond_to do |format|
      if @route.save
        format.html { redirect_to @route, notice: 'Route station was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @route.destroy
    respond_to do |format|
      format.html { redirect_to routes_url, notice: 'Route was successfully destroyed.' }
    end
  end

  private

  def route_params
    params.require(:route).permit(:name)
  end

  def set_route
    @route = Route.find(params[:id])
  end
end
