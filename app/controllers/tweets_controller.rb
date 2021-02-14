class TweetsController < ApplicationController

  before_action :tweets_scope
  before_action :set_tweet, only: %i[show]

  def index
  	@tweets = tweets_scope
  end

  def show
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
