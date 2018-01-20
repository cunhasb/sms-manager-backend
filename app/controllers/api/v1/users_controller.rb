class Api::V1::UsersController < ApplicationController
  def index
    byebug
    render html: '<div>Hello from User</div>'.html_safe
  end

  def show
    byebug
  end
end
