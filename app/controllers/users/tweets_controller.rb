class Users::TweetsController < TweetsController


  before_action :set_user,  only: %i[show index]

  before_action :authenticate_user!, except: %i[show index]
  before_action :authenticate_user_access!,  except: %i[show index]

  before_action :set_tweet, only: %i[show edit update destroy]

  # def index
  # 	@tweets = tweets_scope
  # end

  def new
	 	@tweet = tweets_scope.new
    render "users/tweets/new"
  end

  def create
  	@tweet = @user.tweets.new(tweet_params)
    if @tweet.save
  	  flash[:notice] = I18n.t('tweets.create.success')
  	  redirect_to [current_user, :tweets]
    else
      flash.now[:danger] =  I18n.t('tweets.create.fail')
      render "new"
    end
  end

  # def show
  # end

  def edit
  end

  def validate_user_access
    return if set_user == current_user
    flash[:notice] = I18n.t('unauthorized_access')
    redirect_to root_path and return
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

  def set_user
    @user ||= User.find(params[:user_id])
  end

  def authenticate_user_access!
    return if set_user == current_user
    flash[:danger] =I18n.t('unauthorized_access')
    redirect_to root_path and return
  end

  def set_tweet
    @tweet = set_user.tweets.find(params[:id])
  end

  def tweets_scope
    User.find(params[:user_id]).tweets
  end

  def tweet_params
  	params.require(:tweet).permit(:content)
  end

end
