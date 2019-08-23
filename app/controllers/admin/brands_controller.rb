class Admin::BrandsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  before_action :set_brand, only: %i[show edit update destroy]

  def index
    @brands = Brand.all
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to brand_path(@brand.id), notice:"brand を作成しました!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  if @brand.update(brand_params)
    redirect_to brand_path(@brand.id), notice: "brandを編集しました!"
  else
    render 'edit'
  end
end

def destroy
  @brand.destroy
  redirect_to brands_path, notice:"brandを削除しました!"
end


  private

  def brand_params
    params.require(:brand).permit(:name, :founder, :country, :concept, :found_year, :official)
  end

  def set_brand
    @brand = Brand.find(params[:id])
  end
end
