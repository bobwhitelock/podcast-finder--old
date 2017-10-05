Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#show'

  resources :people, only: [] do
    collection do
      get :search
    end
  end

  resources :notification_requests, only: :create
end
