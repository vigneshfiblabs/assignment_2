class UsersController < ApplicationController
  before_action :authenticate_user!
  def profile
    @user = User.find(params[:id])
    following  = @user.followers.pluck(:follower_id)
    @following_count = following.count
    @following = User.where(:id => following)
    follower  = Follower.where(:follower_id => params[:id]).pluck(:user_id)
    @follower_count = follower.count
    @follower = User.where(:id => follower)
  end
end
