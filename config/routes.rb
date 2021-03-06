Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/auth'
  namespace :api do
    resources :recipes, only: %i[index show create update destroy] do
      resources :comments, only: [:create]
    end
    resources :ingredients, only: [:index]
  end
end
