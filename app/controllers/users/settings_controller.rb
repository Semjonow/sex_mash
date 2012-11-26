class Users::SettingsController < ApplicationController
  before_filter :authenticate_user!

  def edit
    @user     = current_user
    @photos   = current_user.photos
    @profile  = current_user.profile
    @location = current_user.location
  end

  def update

  end
end
