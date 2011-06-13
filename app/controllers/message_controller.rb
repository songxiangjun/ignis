class MessageController < ApplicationController
  before_filter :authenticate_user!

  def show
  end

  def create
    @m = Message.new
    @m.content = params[:message][:content]
    @m.author = current_user.username

    if @m.save
      head :ok #redirect_to :controller => 'home', :action => 'index'
    end
  end

  def update

  end

  def delete
  end

end
