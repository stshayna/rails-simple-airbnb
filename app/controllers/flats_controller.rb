class FlatsController < ApplicationController
  before_action :find_flat, only: %i[show edit update create destroy]

  def index
    @flats = Flat.all
  end

  def show; end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @flat.update(flat_params)
      redirect_to flat_path(@flat)
    else
      render :edit
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :number_of_guests, :description, :price_per_night)
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end
end
