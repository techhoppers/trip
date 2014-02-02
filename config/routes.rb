Trip::Application.routes.draw do
  devise_for :users

  root :to => 'places#index'
  
  resources :places do
    collection do
      match :search
    end
    
    member do
      match :get_distance
    end
  end
  
  resources :categories
  resources :countries
  resources :states
  resources :cities
  resources :reviews
  match "/:id" => "places#show", :as => :detail

end
