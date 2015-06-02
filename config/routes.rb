Rails.application.routes.draw do

  get 'calendar',to: 'calendar#index',as: 'calendar'

  get 'dashboard',to: 'dashboard#index',as: 'dashboard'

  get 'main/index',as: :main

  resources :teetimes

  resources :courses do

    resources :scorecard_templates, except: [:index,:show], path: 'scorecards'

  end

  resources :events do

    resources :teetimes
  	post 'register',to: 'events#register',as: 'register'
  	delete 'register/:id',to: 'events#unregister',as: 'unregister'

  end

  get 'signup/index'

  resources :users
  resources :sessions
  
  root 'splash#index'

  get '/access/normal',to: 'sessions#new',as: 'login'
  get '/access/logout',to: 'sessions#destroy',as: 'logout'
  get '/access/signup',to: 'signup#index',as: 'signup'
  post '/access/signup',to: 'signup#create',as: 'new_signup'

  get 'angularjs/templates/:page',to: 'angularjs#index'

  # API
  namespace :api do
    namespace :v1 do

      post 'teetimes/generate',to: 'generate#create'
      get 'teetimes/generate',to: 'generate#create'

      get 'event_users/available',to: 'event_user#available'

      # API INSERT
			resources :instagram,path: 'instagrams', only: [:index]
      get 'scores/leaderboard',to: 'score#leaderboard'
			resources :score,path: 'scores'
			resources :teetime,path: 'teetimes' do

        get :scorecard,to: 'teetime#scorecard'

      end
			resources :generate,path: 'generates'
			resources :course,path: 'courses'
			resources :round,path: 'rounds'
			resources :user,path: 'users'
			resources :event_user,path: 'event_users'
			resources :event,path: 'events'

    end
  end
  
end