Rails.application.routes.draw do
	root to: "tweets#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

	resources :tweets do
    resources :comments, controller: 'tweets/comments', only: :create
  end

  resources :users, only: [] do
    resources :tweets, controller: 'users/tweets'
  end

  mount ActionCable.server => '/cable'
end
