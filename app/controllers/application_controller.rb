class ApplicationController < ActionController::Base
  before_filter :detect_location

  protect_from_forgery

  protected

  def detect_location
    session['location'] ||= current_user.post_location(request.remote_ip) if user_signed_in?
  end
end
