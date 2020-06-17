Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'users#index'

  namespace :api do
    post 'user', to: 'users#create'
    post 'login', to: 'users#authenticate'

    namespace :reference  do
      scope :company do
        get 'dropdown', to: 'companies#dropdown'
      end
      resources :company, controller: 'companies', only: %i[index create show update destroy]
    end
  end
end
