Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: [:create, :show]
    resources :likes, only: [:create, :show, :index, :destroy]
    resources :dislikes, only: [:create, :show, :index, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
