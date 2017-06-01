class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @carriages = carriage_type.all
  end

  def show
  end

  def new
    @carriage = carriage_type.new
  end

  def edit
  end

  def create
    @carriage = Carriage.new(carriage_params)

    if @carriage.save
      redirect_to carriages_path, notice: 'Carriage was successfully created.'
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
    redirect_to carriages_url, notice: 'Carriage was successfully destroyed.'
  end


  private
  def set_carriage
    @carriage = Carriage.find(params[:id])
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

  def carriage_types
    Carriage.descendants
  end

  def carriage_type
    if params[:carriage].present? && params[:carriage][:type].present?
      typed_model = params[:carriage][:type].constantize
      return typed_model if typed_model.in? carriage_types
    end

    Carriage
  end
end
