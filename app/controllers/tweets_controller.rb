class TweetsController < ApplicationController

  def index
  	@tweets = Tweet.all
  end

  def new
	 	@tweet = Tweet.new
  end

  def create
  	@tweet = Tweet.new(tweet_params)
    if @tweet.save
  	  flash[:notice] = 'Tweet has been created'
  	  redirect_to [:tweets]
    else
      render "new"
    end
  end

  private

  def tweet_params
  	params.require(:tweet).permit(:content)
  end


end
