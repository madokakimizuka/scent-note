class BrandsController < ApplicationController
  before_action :set_brand, only: %i[show edit update destroy]

  def index
    @brands = Brand.all
  end

  def show
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :founder, :country, :concept, :found_year, :official)
  end

  def set_brand
    @brand = Brand.find(params[:id])
  end
end
