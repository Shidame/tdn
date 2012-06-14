Tdn::Application.routes.draw do
  get "infrastructures/buildable"

  root to: 'application#home'

  post   '/sign_in',  to: 'sessions#create',  as: 'sign_in'
  delete '/sign_out', to: 'sessions#destroy', as: 'sign_out'
  get    '/sign_up',  to: 'users#new',        as: 'sign_up'

  post   '/users',    to: 'users#create'

  get '/game', to: 'parcels#index'

  get '/cities', to: 'cities#index'
  get '/cities/:city_id/parcels/:parcel_id/buy', to: 'parcels#buy', as: 'buy_parcel'
  get '/cities/:city_id/parcels/:parcel_id/buildable', to: 'infrastructures#buildable', as: 'buildable_infrastructures'
  post '/cities/:city_id/parcels/:parcel_id/build', to: 'infrastructures#build', as: 'build_infrastructure'

  resources :blogs



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
