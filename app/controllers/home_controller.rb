class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @messages = Message.all
  end

  def provider
    @response = Hash.new

    # Needs code to set up response for new messages.

    render :json => @response
  end
end
