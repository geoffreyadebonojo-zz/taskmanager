Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :topics, only: [:show] do
        resources :videos
      end
    end
  end


  get '/', to: 'welcome#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/profile', to: 'users#show'
  get '/profile/edit', to: 'users#edit'
  post '/profile/edit', to: 'users#update'

  get '/reset_form', to: 'users#reset_form'
  post '/reset_form', to: 'users#password_reset'

  get '/registration', to: 'users#new'
  post '/registration', to: 'users#create'
  get '/activate', to: 'users#activate'
  post '/resend', to: 'users#resend'

  get '/email_verification', to: 'email_verification#show'
  get '/password_reset', to: 'password_reset#show'
  post '/password_reset', to: 'password_reset#reset'

  resources :topics do
    resources :bookmarks
    resources :videos
    resources :notes
    get '/summary', to: 'summary#show'
    post '/summary', to: 'summary#create'
  end

end
