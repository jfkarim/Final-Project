UrbanCanvas::Application.routes.draw do

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
  end

  resource :session, only: [:new, :create, :destroy]

  resources :themes, only: [:create]
  resources :influences, only: [:create]
  resources :media, only: [:create]

  resources :groups do
    resources :group_users, only: [:new, :update, :create, :destroy]
  end

  resources :events do
    resources :event_users, only: [:new, :update, :create, :destroy]
  end

  resources :posts, only: [:new, :create, :destroy]

  root to: "sessions#new"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
