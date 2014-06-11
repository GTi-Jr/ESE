Rails.application.routes.draw do



  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  /Rotas da Session /
  get "log_out" => "session#destroy", :as => "log_out"
  get "log_in" => "session#new", :as => "log_in"
  get "index" => "session#index", :as => "index"
  post "log_in" => "session#create"
  root 'session#new'

  /Rotas para Usuários/
  get "entry" => "users#new", :as => "new_users"


  / Rotas para Cursos/  
  put "subscribe/:id" => "course#subscribe", :as => "subscribe_course"
  put "unsubscribe/:id" => "course#unsubscribe", :as => "unsubscribe_course"
  get 'courses/' => 'courses#index', :as => "courses"  
  get 'course/:id' => 'courses#show'

  / Rotas para Extra/  
  put "subscribe/:id" => "extras#subscribe", :as => "subscribe_extra"
  put "unsubscribe/:id" => "extras#unsubscribe", :as => "unsubscribe_extra"
  get 'extras/' => 'extras#index', :as => "extras"  
  get 'extra/:id' => 'extras#show'

  / Rotas para Tecnicas/  
  put "subscribe/:id" => "teches#subscribe", :as => "subscribe_tech"
  put "unsubscribe/:id" => "teches#unsubscribe", :as => "unsubscribe_tech"
  get 'teches/' => 'teches#index', :as => "teches"  
  get 'tech/:id' => 'teches#show'

  / Rotas para Palestras/  
  put "subscribe/:id" => "lectures#subscribe", :as => "subscribe_lecture"
  put "unsubscribe/:id" => "lectures#unsubscribe", :as => "unsubscribe_lecture"
  get 'lectures/' => 'lectures#index', :as => "lectures"  
  get 'lecture/:id' => 'lectures#show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
