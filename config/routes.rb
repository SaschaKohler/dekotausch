Rails.application.routes.draw do
 
 
  get 'page/about'

  get 'page/contact'
 
  post '/carts/edit/:id', to: 'carts#edit', as: 'edit_cart'
  delete 'sign_out', :to => 'devise/sessions#destroy'
 
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" , :registrations => 'users/registrations' }  
 
  resources :categories
  resources :products
  resources :pictures
  resource :cart, only: [:show]
  
  resources :order_items, only: [:create, :update, :destroy]
  
  

  root 'products#index'

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
     namespace :admin do
      root :to => 'admin/users#index'    
       resources :users
     end
end
