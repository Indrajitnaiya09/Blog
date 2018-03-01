Rails.application.routes.draw do
  devise_for :users
	
  	resources :articles
  	root 'articles#index'

	resources :categories
	resources :reviews

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
