class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @messages = Message.all
  end

  def provider
    @response = Hash.new

    if params[:time]
      @time = Time.at params[:time].to_f
    else
      @time = Time.now - 1.day
    end

    @messages = Message.where "created_at > ?", @time
    if @messages.length > 0
      @response[:html] = render_to_string :partial => "messages"
    end

    @response[:time] = Time.now.to_f

    render :json => @response
  end
end
