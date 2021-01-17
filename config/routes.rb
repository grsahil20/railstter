Rails.application.routes.draw do
	root to: "tweets#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

	resources :tweets
end
