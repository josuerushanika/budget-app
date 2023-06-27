Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show] do
    resources :groups, only: [:index, :show, :new, :create, :destroy]
    resources :budgets
  end

  root 'splash#index'

  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  unauthenticated do
    get '/', to: redirect('/splash')
  end
end
