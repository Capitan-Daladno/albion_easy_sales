Rails.application.routes.draw do
  root "events#index"

  resources :events
    post '/events/:id/edit', to: 'users#create'
  resources :users  do
    put 'giveout', on: :member

  end
end
