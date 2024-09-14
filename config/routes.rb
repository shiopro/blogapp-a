require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  root to: 'articles#index'
  
  resources :articles 

  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end

  scope module: :apps do
    resources :favorites, only: [:index]
    resource :timeline, only: [:show]
    resource :profile, only: [:show, :edit, :update]
  end

  namespace :api do
    scope '/articles/:article_id' do
      resources :comments, only: [:new, :create]
      resource :like, only: [:create, :destroy]
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
