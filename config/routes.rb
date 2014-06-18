Rails.application.routes.draw do



  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  /Rotas da Session /
  get "log_out" => "session#destroy", :as => "log_out"
  get "log_in" => "session#new", :as => "log_in"
  get "index" => "session#index", :as => "index"
  post "log_in" => "session#create"
  root 'session#new'

  /Rotas do Pagseguro /
  post "payment" => "checkout#create", :as => "payment"
  get "payment" => "checkout#new"

  /Rotas para Usuários/
  get "entry" => "users#new", :as => "users"
  post "entry" => "users#create"
  get "recover" => "users#recover", :as => "recover"
  put "recover" => "users#recover_mail", :as => "recover_mail"

  / Rotas para Cursos/  
  put "subscribe_course/:id" => "courses#subscribe", :as => "subscribe_course"
  put "unsubscribe_course/:id" => "courses#unsubscribe", :as => "unsubscribe_course"
  get 'courses/' => 'courses#index', :as => "courses"  
  get 'course/:id' => 'courses#show', :as => "show_course"

  / Rotas para Extra/  
  put "subscribe_extra/:id" => "extras#buy", :as => "buy_extra"
  put "unsubscribe_extra/:id" => "extras#unbuy", :as => "unbuy_extra"
  get 'extras/' => 'extras#index', :as => "extras"  
  get 'extra/:id' => 'extras#show', :as => "show_extra"

  / Rotas para Tecnicas/  
  put "subscribe_tech/:id" => "teches#subscribe", :as => "subscribe_tech"
  put "unsubscribe_tech/:id" => "teches#unsubscribe", :as => "unsubscribe_tech"
  get 'teches/' => 'teches#index', :as => "teches"  
  get 'tech/:id' => 'teches#show', :as => "show_tech"

  / Rotas para Palestras/  
  put "subscribe_lecture/:id" => "lectures#subscribe", :as => "subscribe_lecture"
  put "unsubscribe_lecture/:id" => "lectures#unsubscribe", :as => "unsubscribe_lecture"
  get 'lectures/' => 'lectures#index', :as => "lectures"  
  get 'lecture/:id' => 'lectures#show', :as => "show_lecture"

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
