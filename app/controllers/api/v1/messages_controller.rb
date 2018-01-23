class Api::V1::MessagesController < ApplicationController
  def index
    user = User.all.first
    render json:user.messages
  end
end
