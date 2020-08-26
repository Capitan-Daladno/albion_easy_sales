Rails.application.routes.draw do
  devise_for :sellers
  root 'events#index'

  resources :events
  post '/events/:id/edit', to: 'events#add_user_to_event', as: :add_user_to_event

  resources :users do
    put 'giveout', on: :member
  end
end
