Rails.application.routes.draw do
  devise_for :users
  
  root to: "furimas#index"
  resources :furimas do
    resources :purchase_users 
    resources :orders, only:[:new, :index, :create]
  end

end

