Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'listings#index'


  # Versioning APIs
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      get '/' => 'listings#index'
      post 'users/verification' => 'users#verification'
      post 'users/signin' => 'users#signin'
      get 'users/signout' => 'users#signout'
      get 'users/:id/vehicles' => 'users#show_vehicles'
      get 'vehicles/:id/listing' => 'vehicles#show_listing'
      resources :users, :only => [:index, :create, :show, :update]
      resources :vehicles, :only => [:index, :create, :show, :update]
      resources :photos, :only => [:index, :create, :show, :update]
      resources :listings, :only => [:index, :create, :show, :update]
      resources :deals, :only => [:index, :create, :show, :update]

    end
  end
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
