class PurchasesController < ApplicationController
  before_action :set_purchase, only: %i[show edit update destroy]
  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = current_user.purchases.build(purchase_params)
    if @purchase.save
      redirect_to purchase_path(@purchase.id), notice:"purchase を作成しました!"
    else
      render 'new'
    end
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def edit
  end

  def update
  if @purchase.update(purchase_params)
    redirect_to purchase_path(@purchase.id), notice: "purchaseを編集しました!"
  else
    render 'edit'
  end
end

def destroy
  @purchase.destroy
  redirect_to root_path, notice:"purchaseを削除しました!"
end


  private

  def purchase_params
    params.require(:purchase).permit(:date, :opening_date, :expiration_date, :where_to_buy)
  end

  def set_purchase
    @purchase = current_user.purchases.find(params[:id])
  end
end
