class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  before_action :set_user, only: %i[show edit update destroy]

  def new
  end

  def edit
  end

  def show
  end

  def index
    @users = User.all
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path, notice: "ユーザー「#{@user.name}」を削除しました"
    else
      redirect_to admin_users_path, notice: "管理者がいなくなるので削除できません"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
