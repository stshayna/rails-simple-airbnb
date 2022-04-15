class FlatsController < ApplicationController
  before_action :find_flat, only: %i[show]

  def index
    @flats = Flat.all
  end

  def show; end

  def new
    @flat = Flat.new
  end

  private

  def find_flat
    @flat = Flat.find(params[:id])
  end
end
