Rails.application.routes.draw do

	root 'home#index'

	get '/about', to: 'static#about'
	get '/contact', to: 'static#contact'

	get '/signin', to: 'sessions#new'
	post '/signin', to: 'sessions#create' #change destination
	get '/signout', to: 'sessions#destroy'

	post '/join_event/:id', to: 'events#join', as: 'join'
	post '/leave_event/:id', to: 'events#leave', as: 'leave'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events
  resources :accounts do
  	resources :events, only: [:index, :show, :edit, :update]
  end

	get "/auth/facebook/callback", to: "sessions#create"

end
