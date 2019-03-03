Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :topics, only: [:show] do
        resources :videos
      end
    end
  end


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
    resources :notes
    get '/summary', to: 'summary#show'
    post '/summary', to: 'summary#create'
  end

end
