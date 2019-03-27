Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/signup',  to: 'users#new'
  post 'messages/create', to: 'messages#create', as: 'create_message'
  resources :groups
  resources :members
  # resources :messages
  root 'home#index'
  get 'new_messages', to: 'messages#new_messages'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
