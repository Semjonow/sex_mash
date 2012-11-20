class ApplicationController < ActionController::Base
  before_filter :detect_location

  def remote_ip
    if Rails.env.development?
      '123.45.67.89'
    else
      request.remote_ip
    end
  end

  protect_from_forgery

  protected

  def detect_location
    session['location'] ||= current_user.post_location(remote_ip) if user_signed_in?
  end
end
