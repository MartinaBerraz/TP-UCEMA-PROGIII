Rails.application.routes.draw do
  get 'atuendos/index'
  get 'guardarropas/index'
  get 'home/index'
  root to: 'home#index'

  resources :prendas
  resources :atuendos
  resources :guardarropas
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
