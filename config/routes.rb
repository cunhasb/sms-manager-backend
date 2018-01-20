Rails.application.routes.draw do
  resources :phone_numbers
  resources :carriers
  namespace :api do
    namespace :v1 do
      resources :users
      resources :messages
      resources :campaigns
      post '/auth',to:'auth#create'
      get '/current_user/:id', to: 'auth#show'
      mount ActionCable.server =>'/cable'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
