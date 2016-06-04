Rails.application.routes.draw do

get '/', to: 'static#index'

namespace :api do
    namespace :v1 do
      get '/register', to: 'users#create'
      get '/update_user', to: 'users#update'
      get '/login', to: 'sessions#create'
      get '/query_listings', to: 'queries#query_listings'
      get '/listing', to: 'queries#listing'
    end
  end
end