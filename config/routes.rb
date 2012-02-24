Emeraldcg::Application.routes.draw do
    resources :links

    match '/logout' => 'sessions#destroy', :as => :logout
    match '/login' => 'sessions#new', :as => :login
    #  map.register '/register', :controller => 'users', :action => 'create'
    #  map.signup '/signup', :controller => 'users', :action => 'new'
    resources :users

    resource :session

    resources :staffs
    resources :brands
    resources :banners
    resources :visitors
    match 'visitors' => 'visitors#index', :as => :visitors

    resources :pages
    resources :products
    resources :categories
    resources :categories do 
         resources :brands do  
              resources :products  
         end 
    end


    match 'find_banner' => 'banners#find_banner', :as => :find_banner
    match 'contact' => 'contact#index'
    match 'wish_list' => 'wish_list#index', :as => :wish_list


      match 'home' => 'static#home', :as => :home
      match 'about' => 'static#about', :as => :about
      match 'history' => 'static#history', :as => :history
      match 'shop_info' => 'static#shop_info', :as => :shop_info
      match 'repairs' => 'static#repairs', :as => :repairs
      match 'admin' => 'static#admin', :as => :admin
  
  
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
  root :to => 'static#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
