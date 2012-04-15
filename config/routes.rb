Zimmerman::Application.routes.draw do
  devise_for :users

  get 'site_owner/home/' => 'site_owner/home#index'
  get 'site_owner/cp/' => 'site_owner/cp#index'
  get 'site_owner/cp/main' => 'site_owner/cp#main'
  get 'site_owner/cp/requests' => 'site_owner/cp#requests'
  get 'site_owner/cp/site_editor' => 'site_owner/cp#site_editor'

  devise_for :site_owners, :controllers => {:registrations => 'site_owner/registrations', :sessions => 'site_owner/sessions'}
  #devise_scope :site_owners do 
  #  get 'signin' => 'site_owner/sessions#new', :as => :new_site_owners_session
  #  post 'signin' => 'site_owner/sessions#create', :as => :site_owners_session
  #  delete 'signout' => 'site_owner/sessions#destroy', :as => :destroy_site_owners_session
  #end

  #devise_for :site_owners, :skip => [:registrations, :sessions] do
  #  # devise/registrations:
  #  get 'signup' => 'site_owner/sign_up#sign_up', :as => :new_user_registration
  #  post 'signup' => 'site_owner/sign_up#sign_up', :as => :user_registration
  #  get 'users/cancel' => 'devise/registrations#cancel', :as => :cancel_user_registration
  #  get 'users/edit' => 'devise/registrations#edit', :as => :edit_user_registration
  #  put 'users' => 'devise/registrations#update'
  #  delete 'users/cancel' => 'devise/registrations#destroy'
   
    # devise/sessions:
  #  get 'signin' => 'devise/sessions#new', :as => :new_user_session
  #  post 'signin' => 'devise/sessions#create', :as => :user_session
  #  get 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
  #end

 

    # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'
  
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

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
