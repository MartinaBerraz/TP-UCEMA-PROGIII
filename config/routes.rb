Rails.application.routes.draw do

  get 'home/index'
  root to: 'home#index'

  resources :prendas
  resources :atuendos
  resources :guardarropas


  resources :guardarropas do
    resources :atuendos do
      get 'newrandom', on: :new
    end
  end

  resources :guardarropas do
    resources :atuendos
  end

  resources :atuendos do
    resources :prendas
  end

  resources :guardarropas do
    resources :prendas
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
