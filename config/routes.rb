Rails.application.routes.draw do

  get '/thanks/' => 'home#thanks', :as => :thanks
  get '/get_customer/' => 'home#get_customer'
  get '/get_serial_numbers/' => 'home#get_serial_numbers'
  match '/warrantyregistration_edit/' => 'home#warrantyregistration_edit', :as => :warrantyregistration_edit, via: :get  
  match '/warrantyregistration' => 'home#warrantyregistration', :as => :warrantyregistration, via: :get
  match '/warrantyregistration/:id' => 'home#warrantyregistration_update', :as => :warrantyregistration_update, via: :patch
  resources :colours

  resources :settings

  #resources :sale_to_customers 
  resources :customer_sales_history, :as => :sale_to_customers, :controller => :sale_to_customers

  get '/get_customer_details/' => 'sale_to_customers#get_customer'
  
  #match '/customers' => 'customers#index',:as => :sell_to_customers, via: :get

  resources :customers
    
   match '/user' => 'settings#index',:as => :users, via: :get
   match '/users/new' => 'settings#new', :as => :new_user, via: :get
   match '/user/:id' => 'settings#show', :as => :show_user, via: :get
   match '/users/:id/edit' => 'settings#edit', :as => :edit_user, via: :get

  # match '/sell_to_retailer' => 'sale_histories#index', :as => :sell_to_retailer, via: :get
  # match '/sell_to_retailer/new' => 'sale_histories#new', :as => :new_sell_to_retailer, via: :get
  # match '/sell_to_retailer/:id' => 'sale_histories#show', :as => :show_sell_to_retailer, via: :get
  # match '/sell_to_retailer/:id/edit' => 'sale_histories#edit', :as => :edit_sell_to_retailer, via: :get
  
  match '/serialnumbers' => 'equipment#index',:as => :serialnumbers, via: :get
  match '/equipments/get_models' => 'equipment#get_models', via: :get
  resources :equipment do
    post :import,on: :collection
  end

  resources :retailer_groups
  
  resources :retailer_sales_history, :as => :sale_histories,:controller => :sale_histories
  resources :sale_histories do
      collection do 
        get :equipment_list_by_srno
        get :equipment_detail
        get :retailer_list_by_srno
      end
  end

  get 'jobs/get_serial_numbers/' => 'home#get_serial_numbers'
  match '/check_serial_key/' => 'jobs#check_serial_key', :as => :check_serial_key, via: :get  
  match '/jobs/new/:key' => 'jobs#new', :as => :new_jobs_with_params, via: :get
  
  resources :service_history, :as => :jobs, :controller => :jobs
  #resources :jobs, :as :service_history

  resources :accessories

  resources :models

  resources :brands

  match '/user' => 'users#create', :as => :create_store, via: :post
  match '/stores' => 'users#index',:as => :stores, via: :get
  match '/stores/new' => 'users#new', :as => :new_store, via: :get
  match '/stores/:id' => 'users#show', :as => :show_store, via: :get
  match '/stores/:id/edit' => 'users#edit', :as => :edit_store, via: :get

  
  devise_scope :user do
    get ":contact_person/sign_in" => "devise/sessions#new"
  end  
  
  devise_for :users
  
  match '/users/serialnumbers' => 'users#serial_key_list', :as => :user_key, via: :get
  resources :users do
    collection do
      get :serial_key_list
      get :check_email_uniq
      get :check_contact_person_uniq
    end
  end


  resources :retailers do
    collection do
        post :registration
    end
  end
 
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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
