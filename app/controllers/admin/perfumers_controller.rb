class Admin::PerfumersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  before_action :set_perfumer, only: %i[edit update destroy]

  def new
    @perfumer = Perfumer.new
  end

  def create
    @perfumer = Perfumer.new(perfumer_params)
    if @perfumer.save
      redirect_to perfumer_path(@perfumer.id), notice:"Perfumer を作成しました!"
    else
      render 'new'
    end
  end

  def edit
  end


  def update
    if @perfumer.update(perfumer_params)
      redirect_to perfumer_path(@perfumer.id), notice: "perfumerを編集しました!"
    else
      render 'edit'
    end
  end

  def destroy
    @perfumer.destroy
    redirect_to perfumers_path, notice:"perfumerを削除しました!"
  end


  private

  def perfumer_params
    params.require(:perfumer).permit(:name, :destination_brand_id, :masterpiece_id, :country, :thought)
  end

  def set_perfumer
    @perfumer = Perfumer.find(params[:id])
  end

end
