class Admin::UsersController < ApplicationController
  before_action :require_admin

  def require_admin
    render :error unless current_admin?
  end

  def index

  end

  def show
    @admin = User.find(params[:id])
  end
end
