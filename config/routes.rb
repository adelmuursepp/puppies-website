Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :puppies, except: [:index, :show, :new, :create, :edit, :update, :destroy] do

    collection do
      get 'new', to: 'puppies#new', as: "new"
      post '', to: 'puppies#create', as: "listing"
    end

    member do
      get 'listing', to: 'puppies#listing'
    end
  end

end
