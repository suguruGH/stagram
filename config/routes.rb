Rails.application.routes.draw do
  resources :feeds
  root 'sessions#new'
  resources :pictures do
        collection do
            post :confirm
        end
  end
  resources :users
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]

  if Rails.env.development?
      mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
