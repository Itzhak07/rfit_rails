Rails.application.routes.draw do
  resources :users, only:[:index, :create, :show ] do
    post 'login', on: :collection
    put 'update', on: :collection
  end
  resources :clients, only: [:index, :create, :update]
  resources :workouts, only: [:index, :create, :destroy, :update]
  resources :movements
  resources :work_sets, only:[:index, :show, :update, :destroy]

  root 'home#index'

end
