Rails.application.routes.draw do
  root "events#index"

  resources :events
  resources :users  do
    post 'user#edit', to: 'user#give_out!'
  end

end
