Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :searches, only: %i[index create]
  root 'searches#index'
end
