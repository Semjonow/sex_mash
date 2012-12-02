class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def new
    @message = current_user.sent_messages.build
  end

  def create
    @reciever = User.find(params[:reciever_id])
    unless @reciever.nil?
      @message = current_user.sent_messages.build(params[:message])
      @message.reciever = @reciever
      if @message.save
        @complete = true
      end
    end
  end
end
