class Admin::UsersController < ApplicationController
  before_action :require_admin

  def require_admin
    render :error unless current_admin?
  end

  def show
    @admin = User.find(params[:id])
    @users = User.all
  end

  def index
    @users = User.all
  end
end
