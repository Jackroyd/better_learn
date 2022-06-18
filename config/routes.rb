Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/profile', to: 'pages#profile'
    resources :decks do
      resources :cards, only: [ :new, :create, :edit, :update, :index ]
    end
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
