Rails.application.routes.draw do

  devise_for :admins,path: "admin", controllers: {
  	    sessions: "admin/sessions",
  	    passwords:     'admin/passwords',
        registrations: 'admin/registrations'
  }
  
  namespace :admin do
    resources :bottles, only: [:new, :index, :create, :edit, :update, :destroy]
  end

  scope module: :public do
    root to: 'homes#top'
    resources :bottles, only: [:index, :show]
    resources :images, only: [:create]
    resources :diagnoses, only:  [:create]
    resources :searches, only: [:create]
    resources :comments, only: [:create]
    get "/diagnosis/result" => "diagnoses#result"
    get "/diagnosis" => "diagnoses#diagnosis"
    get "search" => "searches#search"
    get "image" => "images#image"
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
