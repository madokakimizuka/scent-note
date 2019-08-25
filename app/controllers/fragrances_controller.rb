class FragrancesController < ApplicationController
  def index
    # @fragrances = Fragrance.all
    # user が want を true にしている香水を一覧に出したい。
    @q = Fragrance.ransack(params[:q])
    @fragrances = @q.result(distinct: true)

  end

  def show
    @fragrance = Fragrance.find(params[:id])
    @notes = @fragrance.notes
    
  end
end
