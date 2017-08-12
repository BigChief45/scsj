Rails.application.routes.draw do
  get 'trials/index'

  devise_for :users

  devise_scope :user do
    get 'register', to: 'devise/registrations#new'
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end

  root 'trials#index'
end
