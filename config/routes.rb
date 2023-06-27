Rails.application.routes.draw do
  devise_for :users

  resources :users, only: %i[index show] do
    resources :groups, only: %i[index show new create destroy]
    resources :budgets, only: %i[index new]
  end

  root 'splash#index'

  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  unauthenticated do
    get '/', to: redirect('/splash')
  end
end
