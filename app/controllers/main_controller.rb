class MainController < ApplicationController
  before_filter :authenticate_user!, only: [:show]

  def index
    @users = User.all
  end

  def show
    @user     = User.find(params[:id])
    @profile  = @user.profile
    @location = @user.location
    @photos   = @user.photos
  end
end
