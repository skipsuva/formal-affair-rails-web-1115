FormalAffairRails::Application.routes.draw do
  resources :babies,    only: [:new, :create, :edit, :update]
  resources :concretes
  resource :searches, only: [:new, :create]
end
