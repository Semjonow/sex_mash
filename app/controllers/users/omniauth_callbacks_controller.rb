class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  after_filter :run_photos_worker, only: [:facebook]

  def facebook
    @user = User.find_for_facebook_oauth(request.env['omniauth.auth'], current_user)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => 'Facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to root_path
    end
  end

  protected

  def run_photos_worker
    PhotosWorker.perform_async(current_user.id)
  end
end