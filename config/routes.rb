Rails.application.routes.draw do
  root        'todos#index'

  resources   :todos do
    member do
      post 'add_favorite'
      post 'remove_favorite'
    end
  end

  get '/favorite_todos', to: 'todos#favorites'

  devise_for  :users
end
