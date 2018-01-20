class CustomersChannel < ApplicationCable::Channel
  def subscribed
    stream_from "CustomersChannel#{params[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
