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
      post '', to: 'puppies#create', as: ""
      get 'new', to: 'puppies#new', as: "new"
      get 'booked', to: "puppies#booked", as: "booked"
    end

    member do
      get '/', to: 'puppies#show', as: ''
      delete '/', to: 'puppies#destroy', as: 'delete'
      get 'listing', to: 'puppies#listing'
      get 'book', to: 'puppies#book', as: 'book'
    end
  end

end
