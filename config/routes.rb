# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sing_in: :login, sing_out: :logout },
                     controllers: { sessions: 'users/sessions' }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :badges
    resources :gists
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end

  resources :gists, only: :create
  resources :feed_back, only: %i[new create]
  resources :badges,only: :index
end
