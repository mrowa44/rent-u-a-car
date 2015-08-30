Rails.application.routes.draw do
  root 'cars#index'
  resources :cars do
    resources :rentals
  end
end
