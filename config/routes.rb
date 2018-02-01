Rails.application.routes.draw do

	root 		'static_pages#home'

	get 		'/login', to: 'sessions#new'
  post 		'/login', to: 'sessions#create'
  delete  '/logout', to: 'sessions#destroy'
  get 		'sessions/destroy'

  # get 		'posts/new'
  # get 		'posts/create'
  # get 		'posts/index'
  resources :posts, only: [:new, :create, :index]  
end
