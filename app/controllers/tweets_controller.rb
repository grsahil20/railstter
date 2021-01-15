class TweetsController < ApplicationController

  def index
  	@tweets = Tweet.all
  end

  def new
	 	@tweet = Tweet.new
  end

  def create
  	Tweet.create(tweet_params)
  	flash[:notice] = 'Tweet has been created'
  	redirect_to [:tweets]
  end

  private

  def tweet_params
  	params.require(:tweet).permit(:content)
  end


end
