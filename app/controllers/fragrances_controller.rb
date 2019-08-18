class FragrancesController < ApplicationController
  before_action :set_fragrance, only: %i[show edit update destroy]

  def index
    @fragrances = Fragrance.all
  end

  def show
  end

  private

  def fragrance_params
    params.require(:fragrance).permit(:fragrance_id, :content, :date, :weather, :humidity, :point, :scene, :layerd, :want, :image, :image_cache)
  end

  def set_fragrance
    @fragrance = Fragrance.find(params[:id])
  end
end
