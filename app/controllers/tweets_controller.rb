class TweetsController < ApplicationController


  RECORD_NOT_FOUND =  'Tweet not found'

  RECORD_CREATED =  'Tweet has been created'
  RECORD_UPDATED =  'Tweet has been updated'

  RECORD_NOT_CREATED =  "Tweet has not been created"
  RECORD_NOT_UPDATED =   "Tweet can not been updated"


  before_action :set_tweet, only: [:show, :edit, :update]

  def index
  	@tweets = Tweet.all
  end

  def new
	 	@tweet = Tweet.new
  end

  def create
  	@tweet = Tweet.new(tweet_params)
    if @tweet.save
  	  flash[:notice] = RECORD_CREATED
  	  redirect_to [:tweets]
    else
      flash.now[:danger] = RECORD_NOT_CREATED
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      flash[:notice] = RECORD_UPDATED
      redirect_to @tweet
    else
      flash.now[:danger] = RECORD_NOT_UPDATED
      render "new"
    end
  end

  protected

  def resource_not_found
    flash[:alert] = RECORD_NOT_FOUND
    redirect_to root_path
  end

  private

  def set_tweet
    @tweet = Tweet.find params[:id]
  end

  def tweet_params
  	params.require(:tweet).permit(:content)
  end

end
