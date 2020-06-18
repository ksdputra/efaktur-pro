Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'users#index'

  namespace :api do
    post 'signup', to: 'users#create'
    post 'signin', to: 'users#authenticate'
    scope :user do
      post 'upload-p12', to: 'users#upload_p12'
      post 'passphrase', to: 'users#input_passphrase'
      get 'synchronize', to: 'users#synchronize'
    end
    resources :user, controller: 'users', only: %i[show update]

    namespace :reference  do
      scope :company do
        get 'dropdown', to: 'companies#dropdown'
      end
      resources :company, controller: 'companies', only: %i[index create show update destroy]
    end
  end
end
