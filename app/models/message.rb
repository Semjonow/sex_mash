class Message < ActiveRecord::Base
  require 'xmpp4r_facebook'

  belongs_to :sender,   class_name: 'User', foreign_key: 'sender_id'
  belongs_to :reciever, class_name: 'User', foreign_key: 'reciever_id'

  attr_accessible :body

  after_create :perform_sent

  @client = false

  def client
    unless @client
      if sender
        @client = Jabber::Client.new Jabber::JID.new(sender_header)
        @client.connect
        @client.auth_sasl(
            Jabber::SASL::XFacebookPlatform.new(@client, '418049088248783', sender.access_token, '273369d5f5e4c5ae7add677ee0e4e59b'), nil)
      end
    end
    @client
  end

  def sent
    message = Jabber::Message.new(reciever_header, body)
    message.subject = subject
    client.send(message) && close if client
  end

  def close
    client.close if client
  end

  def sender_header
    "-#{sender.uid}@chat.facebook.com" if sender
  end

  def reciever_header
    "-#{reciever.uid}@chat.facebook.com" if reciever
  end

  protected

  def perform_sent
    MessagesWorker.perform_async(id)
  end
end
