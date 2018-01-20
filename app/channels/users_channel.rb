class UsersChannel < ApplicationCable::Channel
  def subscribed
    stream_from "UsersChannel#{params[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
