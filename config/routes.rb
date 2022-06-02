Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
    resources :decks do
      resources :card, only: [ :new, :create ]
    end
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
