Rails.application.routes.draw do
  namespace :api do
    resources :todo_lists
  end
  root 'todo_lists#index'

  resources :todo_lists do
    resources :todo_items do
      member do
        patch :complete
      end
    end
  end
end
