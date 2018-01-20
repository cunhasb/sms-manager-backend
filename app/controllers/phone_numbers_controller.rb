class PhoneNumbersController < ApplicationController
  def index
    numbers = PhoneNumber.all
    render json: numbers
  end
end
