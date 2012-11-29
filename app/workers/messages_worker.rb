class MessagesWorker
  include Sidekiq::Worker

  def perform(message_id)
    message = Message.find(message_id)
    unless message.nil?
      message.sent
    end
  end
end