Rails.application.routes.draw do
  # GET '/' => CatsControllerのindexアクションのコードを動かす
  root to: 'cats#index'

  resources :cats
end
