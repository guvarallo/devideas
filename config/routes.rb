Rails.application.routes.draw do
  root 'ideas#index'

  get    '/login',        to: 'sessions#new'
  post   '/login',        to: 'sessions#create'
  get    '/logout',       to: 'sessions#destroy'

  resources :users, except: [:index, :show]
  resources :ideas, except: [:index, :show] do
    member do
      post :like
    end
  end

end
