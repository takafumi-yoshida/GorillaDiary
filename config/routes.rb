Rails.application.routes.draw do
  devise_for :users, except:[:edit, :update]
    
  root "homes#top"
  resources :diaries do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  resources :users, only: [:edit, :update, :show] do
    resources :relationships, only: [:create, :destroy]
  end
end
