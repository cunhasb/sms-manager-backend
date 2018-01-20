class CarriersController < ApplicationController
  def index
    carriers = Carrier.all
    render json: carriers
  end
end
