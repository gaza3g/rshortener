Rshortener::Application.routes.draw do
  root to: "links#index"
  resources :links
  resources :visitors
end
