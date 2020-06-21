Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'users#index'

  namespace :api do
    # USER COLLECTION
    post 'signup', to: 'users#create'
    post 'signin', to: 'users#authenticate'
    resources :user, controller: 'users', only: %i[index update]

    namespace :reference  do
      # COMPANY COLLECTION
      scope :company do
        get 'dropdown', to: 'companies#dropdown'
      end
      resources :company, controller: 'companies', only: %i[index create show update destroy]

      # PRODUCT COLLECTION
      scope :product do
        get 'dropdown', to: 'products#dropdown'
      end
      resources :product, controller: 'products', only: %i[index create show update destroy]
    end
  end
end
