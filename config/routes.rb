Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/show'
  get '/', to: 'welcome#show'
end
