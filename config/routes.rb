Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:show] do
  end
  get 'ohayos/top' => 'ohayos#top'
  
  resources :ohayos do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]   

  end
  resources :tweets do
    resources :goods, only: [:create, :destroy]
    resources :letters, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
   
  

  root 'ohayos#index'

  


end
