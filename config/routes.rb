Rails.application.routes.draw do
  get 'notifications/index'

  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    get 'register', to: 'devise/registrations#new'
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end

  resources :users, only: [:show]
  resources :trials do
    resources :trial_presentations
  end

  resources :people
  get 'people_search', to: 'people#search'

  resources :notifications

  root 'trials#index'
end
