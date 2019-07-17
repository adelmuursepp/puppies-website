Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, except: [:index, :show, :new, :create, :edit, :update, :destroy] do
    collection do
      get '/', to: 'users#profile', as: 'profile'
    end
  end
  resources :puppies, except: [:index, :show, :new, :create, :edit, :update, :destroy] do

    collection do
      get '', to: "puppies#index"
      get 'new', to: 'puppies#new', as: "new"
      post '', to: 'puppies#create', as: ""
    end

    member do
      get 'listing', to: 'puppies#listing'
      get '/', to: 'puppies#show', as: ''
      get 'book', to: 'puppies#book', as: 'book'
      delete '/', to: 'puppies#destroy', as: 'delete'
    end
  end

end
