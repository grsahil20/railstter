class TweetsController < ApplicationController

  before_action :set_tweet, only: [:show]

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
      flash.now[:danger] = "Tweet has not been created"
      render "new"
    end
  end

  def show
  end


  private

  def set_tweet
    @tweet = Tweet.find params[:id]
  end

  def tweet_params
  	params.require(:tweet).permit(:content)
  end


end
