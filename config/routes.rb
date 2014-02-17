Rshortener::Application.routes.draw do
  match ':id' => "links#show", via: :get
  root to: "links#index"
  resources :links
  resources :visitors
end
