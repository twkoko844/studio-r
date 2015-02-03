Studio::Application.routes.draw do
  root to: "top#index"
  get "about" => "top#about", as: "about"
  get "login" => "top#login", as: "login"
  resources :members, only: [:new, :create]
  resource :session, only: [:create, :destroy]
  resources :bookings, only: [:show, :new, :create, :destroy] do
    collection { get "search" }
    collection { get "booksearch" }
    collection { get "check" }
  end
  resources :bookedmaterials, only: [:new, :create]
  resources :rooms, only: [:show]
  namespace :admin do
    root to: "top#index"
    resources :materials do
      collection { put "suspend" }
    end
    resources :members do
      collection { put "suspend" }
    end
    resources :bookings do
      collection { get "search" }
    end
    resources :rooms, only: [:index, :show]
  end
  resource :account, only: [:show, :edit, :update, :destroy] do
    get "check"
  end
end
