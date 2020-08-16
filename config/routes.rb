# frozen_string_literal: true

# router
Rails.application.routes.draw do
  get 'log_out' => 'sessions#destroy', :as => 'log_out'
  get 'log_in' => 'sessions#new', :as => 'log_in'
  get 'sign_up' => 'users#new', :as => 'sign_up'
  get 'notes' => 'notes#index', :as => 'notes'
  root to: 'sessions#new'
  resources :users
  resources :sessions
  resources :notes

  get :note_email, to: 'notes#note_email', as: :note_email
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
