class Tweets::CommentsController < TweetsController

  before_action :authenticate_user!
  before_action :set_tweet

  def create
  	@comment = @tweet.comments.new(comment_params)

    if @comment.save
  	  flash[:notice] = I18n.t('comments.create.success')
  	  redirect_to @tweet
    else
      flash.now[:danger] =  I18n.t('comments.create.fail')
      render "tweets/show"
    end
  end

  protected

  def resource_not_found
    flash[:alert] = I18n.t('tweets.not_found')
    redirect_to root_path
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

  def comment_params
  	params.require(:comment).permit(:content).to_h.merge(user: current_user)
  end

end
