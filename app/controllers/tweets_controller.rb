class TweetsController < ApplicationController

  before_action :tweets_scope
  before_action :set_tweet, only: %i[show]

  def index
  	@tweet_pages, @tweets = pagy(tweets_scope)
  end

  def show
  	@comment_pages, @comments = pagy(@tweet.comments)
    @comment = Comment.new(tweet: @tweet)
  end

  protected

  def resource_not_found
    flash[:alert] = I18n.t('tweets.not_found')
    redirect_to root_path
  end

  private

  def tweets_scope
    @tweets_scope ||= Tweet.all
  end

  def set_tweet
    @tweet = Tweet.find params[:id]
  end

  def tweet_params
    params.require(:tweet).permit(:content)
  end

end
