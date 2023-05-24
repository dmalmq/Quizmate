Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :interests, only: [:index, :show, :create]
  resources :quizzes, only: [:index, :show, :create, :new] do
    resources :questions, only: [:show]
    namespace :quizzes do
      resources :questions
    end
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

# questions
# interests/questions -> show

# quizzes/questions -> show
