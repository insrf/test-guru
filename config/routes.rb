Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: :gurus, path_names: {sign_in: :login, sign_out: :logout},
              controllers: { registrations: 'users/registrations' }

  # resources :feedbacks, only: %i[index create]
  get "feedbacks" => "feedbacks#show"
  post "feedbacks" => "feedbacks#create"

  resources :tests, only: :index do
    resources :questions, shallow: true, expect: :index do
      resources :answers, shallow: true, expect: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  get "my_bages" => "bages#my_bages"

  get "bages" => "bages#index"

  namespace :admin do
    resources :bages, shallow:true do
      post "user_bages" => "user_bages#create"
      get "new_user_bage" => "user_bages#new"
    end

    resources :user_bages, shallow:true do
    end

    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow:true do
        resources :answers, shallow:true
      end
    end

    resources :gists, only: :index
  end

end
