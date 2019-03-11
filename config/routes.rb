Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :patients, only: [:new, :create, :show] do
    resources :pictures, only: [:new, :create]
    resources :diagnosis, only: [:new, :create, :show, :index]
  end

  resources :doctors, only: [:new, :create, :update, :edit]

  resources :questions, only: [:show] do
    resources :patient_answers, only: [:new, :create]
  end

  resources :diagnosis, only: [] do
    resources :prescriptions, only: [:new, :create,:show]
  end

  resources :medicines, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :flats, only: [:index, :show, :new, :create, :destroy, :update, :edit] do
  #   resources :bookings, only: [:index, :show, :new, :create, :edit, :update]

  #   resources :images, only: [:index, :create]
  # end
  # resources :images, only: [:destroy]

  # resources :bookings, only: [:destroy] do
  #   resources :reviews, only: [:new, :create]
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
