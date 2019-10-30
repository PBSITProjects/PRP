require 'sidekiq'
require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :admins, path: 'admins', controllers: 
  {sessions: 'admins/sessions'}
  devise_for :users, path: 'users', controllers: 
  {sessions: 'users/sessions'}

  get '/404', :to => "errors#not_found"
  get '/422', :to => "errors#unacceptable"
  #get '/500', :to => "errors#server_error"
  
  get '/signup' => 'signups#index'
  post '/signup' => 'signups#create'

  authenticated :user do 
  	root to: 'public#userpage', as: "authenticated_user" 
    resources :users
    resources :franchises, only: [:edit]

  end

  authenticated :admin do 
  	root to: 'public#adminpage', as: "authenticated_admin" 
    mount Logster::Web, at: "/logs"
    mount Sidekiq::Web => '/sidekiq'
    namespace :admins do 
      resources :admins
      resources :franchises
    end

  end
  
  root to: 'public#main'

  
end
