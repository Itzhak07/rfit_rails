Rails.application.routes.draw do

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

end
