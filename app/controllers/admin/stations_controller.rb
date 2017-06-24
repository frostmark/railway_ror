class Admin::StationsController < Admin::BaseController
  before_action :set_station, except: [:index ,:new, :create]
  before_action :set_route, only: [:update_position, :update_time]

  def index
    @stations = Station.all
  end

  def show
  end

  def new
    @station = Station.new
  end

  def edit
  end

  def create
    @station = Station.new(station_params)

    if @station.save
      redirect_to [:admin, @station], notice: 'Station was successfully created.'
    else
      render :new
    end
  end

  def update
    if @station.update(station_params)
      redirect_to [:admin, @station], notice: 'Station was successfully updated.'
    else
      render :edit
    end
  end

  def update_position
    @station.update_position(@route, params[:position])

    redirect_to [:admin, @route]
  end

  def update_time
    @station.update_time(@route, params)

    redirect_to [:admin, @route]
  end

  def destroy
    @station.destroy
    redirect_to admin_stations_url, notice: 'Station was successfully destroyed.'
  end

  private

  def set_station
    @station = Station.find(params[:id])
  end

  def set_route
    @route = Route.find(params[:route_id])
  end

  def station_params
    params.require(:station).permit(:name)
  end
end
