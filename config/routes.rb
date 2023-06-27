Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show] 
  resources :budget
  resources :groups

  root 'splash#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  unauthenticated do
    get '/', to: redirect('/splash')
  end
end
