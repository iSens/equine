Magazine::Application.routes.draw do
  
  get "page/about"

  get "page/member"

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'  
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions  
  resources :issues
  root :to => 'issues#index'
end
