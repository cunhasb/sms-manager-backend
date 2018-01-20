class Api::V1::MessagesController < ApplicationController
  def index
    render html: '<div>Hello from Messages</div>'.html_safe
  end
end
