Rails.application.routes.draw do
  root to: 'movies#index'
  get 'users/:user_id/movies', to: 'movies#search'
  resources :movies do
    post :search, on: :collection
  end
end
