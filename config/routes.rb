Rails.application.routes.draw do

  resources :reviews, only: :destroy
  resources :restaurants do
    resources :reviews, only: [:new, :create]
     # url /restaurants/:restaurant_id/reviews/new
    collection do
      get :top
      # get "restaurants/top", to: "restaurants#top"
    end
    member do
      get :chef
      # get "restaurants/:id/chef", to: "restaurants#chef"
    end
  end
end
