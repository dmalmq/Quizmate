Rails.application.routes.draw do
  # Admin
  require "sidekiq/web"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  # Production
  root to: "pages#home"

  resources :users, only: %i[show index update]
  resources :interests, only: %i[index show create update destroy] do
    resources :questions, only: [:create]
  end
  resources :quizzes, only: %i[index show create new] do
    resources :challenges, only: %i[create new show]

    resources :questions, only: [:show], controller: "quizzes/questions"
  end
  resources :questions, only: [:destroy]

  resources :challenges, only: %i[destroy update]
  authenticate :user, ->(user) { user.admin? } do
    mount Blazer::Engine, at: "blazer"
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end

# questions
# interests/questions -> show

# quizzes/questions -> show
