
class Users::TweetsController < ApplicationController

  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
  	@tweets = Tweet.all
  end

  def new
	 	@tweet = Tweet.new
  end

  def create
  	@tweet = Tweet.new(tweet_params)
    if @tweet.save
  	  flash[:notice] = I18n.t('tweets.create.success')
  	  redirect_to [:tweets]
    else
      flash.now[:danger] =  I18n.t('tweets.create.fail')
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      flash[:notice] = I18n.t('tweets.update.success')
      redirect_to @tweet
    else
      flash.now[:danger] = I18n.t('tweets.update.fail')
      render "new"
    end
  end

  def destroy
    if @tweet.destroy
      flash[:notice] = I18n.t('tweets.destroy.success')
    else
      flash.now[:danger] = I18n.t('tweets.destroy.fail')
    end
    redirect_to :tweets
  end

  protected

  def resource_not_found
    flash[:alert] = I18n.t('tweets.not_found')
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
