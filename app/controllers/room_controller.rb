class RoomController < ApplicationController
  def index
    @rooms = Room.all
    render :json => { :rooms => @rooms, :success => true }
  end
end
