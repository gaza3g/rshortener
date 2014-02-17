Rshortener::Application.routes.draw do
  root to: "links#index"
  resources :links
  get 'visitors', to: 'visitors#index'
end
