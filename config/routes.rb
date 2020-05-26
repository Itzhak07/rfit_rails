Rails.application.routes.draw do
  resources :users, only:[:index, :create, :show ]
  resources :clients, only: [:index, :create, :update]
  resources :workouts, only: [:index, :create, :destroy, :update]
  resources :movements
  resources :work_sets, only:[:index, :show, :update, :destroy]

  root 'home#index'

  #update user info
  put '/users/update' => 'users#update'

  #login
  post '/users/login' => 'users#login'

end
