class PerfumersController < ApplicationController
  def index
    @perfumers = Perfumer.all
  end

  def show
    @perfumer = Perfumer.find(params[:id])
    if @perfumer.destination_brand_id.present?
      @brand = Brand.find(@perfumer.destination_brand_id)
    end
    if @perfumer.masterpiece_id.present?
      @fragrane = Fragrance.find(@perfumer.masterpiece_id)
    end
  end
end
