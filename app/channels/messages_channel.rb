class MessagesChannel < ApplicationCable::Channel
  def subscribed
  stream_from "MessagesChannel#{params[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
