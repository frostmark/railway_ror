class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]

  def show; end

  def new
    @carriage = Carriage.new
  end

  def edit
  end

  def create
    @carriage = Carriage.new(carriage_params)

    if @carriage.save
      redirect_to train_path(params[:train_id]), notice: 'Carriage was successfully created.'
    else
      render :new
    end
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to carriages_path, notice: 'Carriage was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to trains_path, notice: 'Carriage was successfully destroyed.'
  end


  private
  def set_carriage
    @carriage = Carriage.find(params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def carriage_params
    params.require(:carriage).permit(
      :train_id,
      :type,
      :top_seats,
      :low_seats,
      :side_top_seats,
      :side_low_seats,
      :sedentary_seats
    )
  end
end
