Rails.application.routes.draw do
  get 'tweets/new'

	root to: "tweets#index"

	resources :tweets, only: [:index, :new, :create]
end
