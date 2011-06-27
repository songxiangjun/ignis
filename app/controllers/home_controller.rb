class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    # @messages = Message.all
  end
  
  def userlist
    users = User.select("username, id")
    render :json => { :users => users, :success => true }
  end

end
