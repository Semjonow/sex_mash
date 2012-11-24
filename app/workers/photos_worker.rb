class PhotosWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    unless user.nil?
      user.get_photos
    end
  end
end