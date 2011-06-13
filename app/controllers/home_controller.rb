class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @messages = Message.all
  end

  def provider
    @messages = Message.all

    @response = Hash.new
    @response[:html] = render_to_string :partial => "messages"

    render :json => @response
    # Needs code to set up response for new messages.

#    render :json => @response
  end
end
