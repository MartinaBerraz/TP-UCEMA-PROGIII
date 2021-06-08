Rails.application.routes.draw do

  devise_for :users
  get 'home/index'
  root to: 'home#index'


  resources :guardarropas do
    resources :atuendos do
      get 'newrandom', on: :new
      end
  end

  resources :atuendos do
    resources :prendas
  end

  resources :guardarropas do
    resources :prendas
  end

  resources :guardarropas do
    resources :atuendos
  end

  resources :prendas
  resources :atuendos
  resources :guardarropas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
