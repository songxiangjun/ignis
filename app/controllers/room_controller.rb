class RoomController < ApplicationController
  before_filter :authenticate_user!

  def index
    @rooms = Room.all
    render :json => { :rooms => @rooms, :success => true }
  end
end
