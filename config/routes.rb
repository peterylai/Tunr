Rails.application.routes.draw do
  root 'welcome#index'

  resources :artists do
    resources :songs, except: [:index, :show], shallow: true do
      resources :purchases, only: [:create]
    end
  end
  
  get '/search' => 'songs#search'

  resources :users, except: [:index] do
    resources :songs, only: [:index]
  end
  resources :sessions, only: [:create]

  get '/signup' => 'users#new'
  get '/signin' => 'sessions#new'
  delete '/signout' => 'sessions#destroy'

end
