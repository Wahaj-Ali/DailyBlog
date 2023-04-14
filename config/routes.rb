Rails.application.routes.draw do
  devise_for :users
  root "users#index"
 resources :users, only: [:index, :show] do
  resources :posts, only: [:index, :show, :new, :create, :destroy] do
    resources :comments, only: [ :index, :new, :create, :destroy]
    resources :likes, only: [:create]
    end
  end
  scope :api, defaults: { format: :json }, module: :api, constraints: { subdomain: 'api' } do
    
      resources :posts, only: [:index] do
        resources :comments, only: [:index, :create]
      end
   
  end
end
