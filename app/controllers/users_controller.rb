class UsersController < ApplicationController

  def index
  end

  def show
    @user = current_user
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :icon, :signature_fragrance, :favorite_brand_id, :favorite_perfumer_id, :favorite_type, :prefecture, :sex, :age)
  end
end
