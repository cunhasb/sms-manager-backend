class CampaignsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "CampaignsChannel#{params[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
