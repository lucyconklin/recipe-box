class UsersController < ApplicationController

  def index

  end

  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    flash[:success] = "Successfully created account for #{user.first_name}"
    redirect_to user_path(user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :password,
                                 :role)
  end
end
