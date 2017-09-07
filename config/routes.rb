Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    get 'register', to: 'devise/registrations#new'
    get 'settings', to: 'devise/registrations#edit'
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end

  resources :users, only: [:show]

  resources :trials do
    resources :trial_presentations
  end

  resources :people do
    get 'search', on: :collection
  end

  resources :notifications, only: [:index] do
    post :mark_as_read, on: :collection
    post :mark_as_read, on: :member
  end

  root 'trials#index'
end
