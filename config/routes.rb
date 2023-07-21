Rails.application.routes.draw do
  root 'pages#index'
  namespace :api do
    namespace :v1 do
      resources :products, only: [:create, :show, :index]
    end
  end
end
