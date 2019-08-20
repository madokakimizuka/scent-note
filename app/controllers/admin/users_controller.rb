class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  def new
  end

  def edit
  end

  def show
  end

  def index
  end
end
