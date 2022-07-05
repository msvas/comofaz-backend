Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'overrides/registrations'
  }

  namespace :api do
    namespace :v1 do

      namespace :instructor do
        resources :questions, only: [:index]
      end

      resources :questions
      resources :subject_topics, only: [:index]
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
