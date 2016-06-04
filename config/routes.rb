Rails.application.routes.draw do

get '/', to: 'static#index'

namespace :api do
    namespace :v1 do
      get '/register', to: 'users#create'
      get '/login', to: 'sessions#create'
      # post '/job_applications', to: 'job_applications#create'
    end
  end
end