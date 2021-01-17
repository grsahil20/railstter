Rails.application.routes.draw do
	root to: "tweets#index"

	resources :tweets, only: [:index, :new, :create, :show]
end
