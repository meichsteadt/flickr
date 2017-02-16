Rails.application.routes.draw do
  devise_for :users
  
  resources :profiles do
    resources :images
  end

  resources :images
  root to: 'landing#index'
end
