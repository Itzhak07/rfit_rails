Rails.application.routes.draw do

  get 'work_sets/index'
  get 'work_sets/create'
  get 'work_sets/show'
  get 'work_sets/update'
  get 'work_sets/destroy'
  get 'sets/index'
  get 'sets/create'
  get 'sets/show'
  get 'sets/update'
  get 'sets/destroy'
  get 'movements/index'
  get 'movements/create'
  get 'movements/show'
  get 'movements/update'
  get 'movements/destroy'
  root 'home#index'

  get '/users' => 'users#index'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show'
  put '/users/update' => 'users#update'
  delete '/users/:id' => 'users#destroy'

  #login
  post '/users/login' => 'users#login'

 #get user
  get '/auth/auth_user' => 'users#get_user'

  get '/clients' => 'clients#index'
  post '/clients' => 'clients#create'
  put '/clients' => 'clients#update'

  get '/workouts' => 'workouts#index'
  post '/workouts' => 'workouts#create'
  delete '/workouts/delete/:id' =>'workouts#destroy'
  put '/workouts' => 'workouts#update'
  get '/workouts/:id' =>'workouts#show'

  # movements

  get '/movements' => 'movements#index'
  post '/movements' => 'movements#create'
  delete '/movements/delete/:id' => 'movements#destroy'


  #sets

  get '/sets' =>'work_sets#index'
  post '/sets' => 'work_sets#create'
  delete '/sets/delete/:id' => 'work_sets#destroy'
end
