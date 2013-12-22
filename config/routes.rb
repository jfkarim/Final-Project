UrbanCanvas::Application.routes.draw do
  root to: "sessions#new"

  resources :users do
    resources :themes, only: [:index]
    resources :user_themes, only: [:create, :destroy]

    resources :influences, only: [:index]
    resources :user_influences, only: [:create, :destroy]

    resources :media, only: [:index]
    resources :user_media, only: [:create, :destroy]

    resources :locations, only: [:index]
    resources :user_locations, only: [:create, :destroy]

    resources :friendships, only: [:create, :destroy, :update]

    resources :albums, only: [:create, :destroy, :update]

    resources :photos, only: [:create, :destroy, :update]

    resource :news_feed, only: [:show]
  end

  resource :session, only: [:new, :create, :destroy]

  resources :themes, only: [:create]
  resources :influences, only: [:create]
  resources :media, only: [:create]

  resources :groups do
    resources :group_users, only: [:create, :destroy, :update]
  end

  resources :events do
    resources :event_users, only: [:create, :destroy, :update]
  end

  resources :posts, only: [:create, :destroy, :update]

  resources :comments, only: [:create]

  resources :likes, only: [:create, :destroy]

end
