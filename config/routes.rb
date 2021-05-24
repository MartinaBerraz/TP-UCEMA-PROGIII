Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'

  resources :prendas
  resources :guardarropas
  resources :atuendos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
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
