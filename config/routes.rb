Rails.application.routes.draw do
  devise_for :users, except:[:edit, :update]
  root "homes#top"
  resources :diaries
  resources :users, only: [:edit, :update]
end
