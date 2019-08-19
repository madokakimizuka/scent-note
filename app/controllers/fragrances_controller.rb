class FragrancesController < ApplicationController
  def index
    @fragrances = Fragrance.all
    # user が want を true にしている香水を一覧に出したい。
  end

  def show
    @fragrance = Fragrance.find(params[:id])
  end
end
