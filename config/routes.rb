Bayaninhand::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  match "dashboard" => "dashboard#events"
  match "search" => "search#simple"
  match "advanced-search" => "search#advanced", :as => :advanced_search
  match "advanced-search-results" => "search#advanced_results", :as => :advanced_search_results
  match "advanced-search-events" => "search#advanced_events", :as => :advanced_search_events
  match "about" => "pages#about", :as => :about
  match "contact-us" => "pages#contact_us", :as => :contact_us
  match "terms-and-conditions" => "pages#terms_and_conditions", :as => :terms_and_conditions
  match "privacy-policy" => "pages#privacy_policy", :as => :privacy_policy
  post "/emails" => "emails#create"

  resources :volunteers do
    get 'profile', :on => :collection
  end
  resources :event_types

  resources :categories

  resources :participations

  devise_for :users do
    get 'users', :to => 'volunteers#profile', :as => :user_root
  end

  #resources :events

  resources :organizations do
    member do
      get 'admin', :as => :user_admin
    end
    resources :events do
      member do
        get 'volunteer'
      end
    end
  end

  resources :comments, :only => [:create, :destroy]

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
  # root :to => "welcome#index"
  root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
