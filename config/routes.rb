Rails.application.routes.draw do
  root        'todos#index'
  resources   :todos
  devise_for  :users
end
