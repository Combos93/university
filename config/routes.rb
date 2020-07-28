Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root to: 'courses#index'

  resources :courses, only: %i[index show] do
    resources :groups do
      resources :user_groups, only: %i[create]
    end
  end
end
