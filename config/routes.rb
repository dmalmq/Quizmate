Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "pages#home"
  resources :interests, only: [:index, :show, :create, :destroy]
  resources :quizzes, only: [:index, :show, :create, :new] do
    resources :challenges, only: [:create, :new, :show]
    resources :questions, only: [:show], controller: "quizzes/questions"
  end
  resources :questions

  resources :challenges, only: [:destroy, :update]
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
