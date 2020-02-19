Rails.application.routes.draw do
  root "tweets#index"
  resources :tweets
  post "followers/follow/:id" => "followers#follow"
  post "followers/unfollow/:id" => "followers#unfollow"
  resources :followers
  get "users/profile/:id" => "users#profile"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
