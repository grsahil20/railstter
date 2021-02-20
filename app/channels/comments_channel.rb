class CommentsChannel < ApplicationCable::Channel
  def subscribed
    p current_user
    stream_from "comments"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
