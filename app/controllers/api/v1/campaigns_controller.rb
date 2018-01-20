class Api::V1::CampaignsController < ApplicationController
  def index
    campaigns = Campaign.all
    render json: campaigns
    # render html: '<div>Hello from Campaigns</div>'.html_safe
  end
  def show
    byebug
  end
  def create
    # byebug
    campaign = Campaign.create(user_id: User.all.first.id,name:params[:title])
    render json: campaign
  end
end
