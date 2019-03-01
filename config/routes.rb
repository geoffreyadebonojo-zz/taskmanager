Rails.application.routes.draw do

  get '/', to: 'welcome#show'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/profile', to: 'users#show'
  get '/registration', to: 'users#new'
  post '/registration', to: 'users#create'

  resources :topics do
    resources :bookmarks
    resources :videos
  end

end
