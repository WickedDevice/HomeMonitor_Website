Rails.application.routes.draw do
  resources :sensors

  resources :buildings

  resources :sensor_data

  resources :devices

  resources :users

  resources :pages
  get 'home', to: 'pages#home'
  get 'faq', to: 'pages#faq'
  get 'buy', to: 'pages#buy'

  resources :sessions, only: [:create, :new]
  post 'sessions/destroy', to: 'sessions#destroy'
  get 'sessions/destroy', to: 'sessions#destroy'
  


  post 'first_contact/:address', to: "devices#first_contact"
  get  'first_contact/:address', to: "devices#first_contact"


  post 'sensor_data/batch_create/:device_address', to: 'sensor_data#batch_create'
  get 'sensor_data/batch_create/:device_address', to: 'sensor_data#batch_create'

  get 'buildings/:id/chart', to: 'buildings#chart'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'

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
