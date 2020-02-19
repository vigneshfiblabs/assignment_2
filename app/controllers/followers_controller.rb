class FollowersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]



#   def index
#     @tweets = Tweet.all.order( created_at: :desc)
#   end


#   def new
#     @tweet = Tweet.new
#   end

 def follow
    current_user.followers.create(:follower_id => params[:id])
    redirect_to '/'
 end
 def unfollow
    current_user.followers.find_by(:follower_id => params[:id]).delete
    redirect_to '/'
 end

  def create
    @tweet = current_user.tweets.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

 


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:post)
    end
end
