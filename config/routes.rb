Rails.application.routes.draw do

	root 'static_pages#home'

	get "/login", to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'sessions/destroy'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
