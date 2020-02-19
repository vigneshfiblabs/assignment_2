class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    following  = current_user.followers.pluck(:follower_id)
    follower  = Follower.where(:follower_id => current_user.id).pluck(:user_id)
    users = (following + follower).uniq
    @tweets = Tweet.where(:user_id => users).order( created_at: :desc)
    @tweets_all = Tweet.all.order( created_at: :desc)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.create(tweet_params)
    redirect_to '/'
    
  end

  private
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    def tweet_params
      params.require(:tweet).permit(:post)
    end
end
