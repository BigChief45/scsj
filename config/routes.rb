Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get 'register', to: 'devise/registrations#new'
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end

  resources :users, only: [:show]
  resources :trials
  resources :people

  root 'trials#index'
end
