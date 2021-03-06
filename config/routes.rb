Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :new, :create]
  resource :session, only:[:new, :create, :destroy]
  resource :bands, only: [:index, :create, :new, :edit, :show, :update, :destroy]
end
