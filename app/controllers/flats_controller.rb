class FlatsController < ApplicationController
  before_action :find_flat, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @query = params[:query]
      @flats = Flat.where('name ILIKE ?', "%#{@query}%")
    else
      @flats = Flat.all
    end
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

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :number_of_guests, :description, :price_per_night)
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end
end
