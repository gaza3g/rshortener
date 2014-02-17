Rshortener::Application.routes.draw do
  resources :links
  resources :visitors
  match ':id' => "links#show", via: :get
  root to: "links#index"
end
