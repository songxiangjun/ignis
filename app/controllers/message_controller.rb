class MessageController < LoggedInController

  # MUST add validation to this very soon.
  def create
    content  = params[:message][:content]
    room     = params[:message][:room_id]
    username = current_user.username

    if Message.create({ :content => content, :room_id => room, :author => username, :user => current_user })
      head :ok
    end
  end

  def delete
  end

end
