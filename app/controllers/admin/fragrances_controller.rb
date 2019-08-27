class Admin::FragrancesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  before_action :set_fragrance, only: %i[edit update destroy]

  def new
    @fragrance = Fragrance.new
  end

  def create
    @fragrance = Fragrance.new(fragrance_params)
    if @fragrance.save
      redirect_to fragrance_path(@fragrance.id), notice:"Fragrance を作成しました!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @fragrance.update(fragrance_params)
      redirect_to fragrance_path(@fragrance.id), notice: "fragranceを編集しました!"
    else
    render 'edit'
    end
  end

  def destroy
    @fragrance.destroy
    redirect_to fragrances_path, notice:"fragranceを削除しました!"
  end


  private

  def fragrance_params
    params.require(:fragrance).permit(:description, :name, :brand_id, :perfumer_id, :type, :price, :country, :release, :image, :image_cache)
  end

  def set_fragrance
    @fragrance = Fragrance.find(params[:id])
  end
end
