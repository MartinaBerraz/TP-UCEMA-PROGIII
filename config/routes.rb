Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'

  get 'guardarropa/:id/atuendos', to: "atuendos#newrandom"



  resources :prendas
  resources :guardarropas
  resources :atuendos

  resources :guardarropas do
    resources :atuendos
  end

  resources :atuendos do
    resources :prendas
  end

  resources :guardarropas do
    resources :prendas
  end

end
