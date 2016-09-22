Rails.application.routes.draw do
  resources :comentarios
  resources :usuarios
  get 'sign_in' => 'sessions#new' 
  post 'sign_in' => 'sessions#create' 
  get 'sign_out' => 'sessions#destroy'  
  resources :criador_organizacao
  resources :portfolios
  resources :projetos
  resources :processos do
    resources :atividades
end

  match '/atividades/criar/:id' => 'processos#new_atividade', :as => :atividade_criar, :via => :get
  match "/atividades/criar/:id" => 'processos#create_atividade', :via => :post, :as => :atividade_create
 
  match "/organizacao/criar" => 'criador_organizacao#create', :via => :post, :as => :organizacao_create

  match "/processos/atividades/:id/:id/edit" => 'processos#edit_atividade', :as => :atividade_editar, :via => :get
  match "/processos/atividades/:id/:id/edit" => 'processos#update_atividade', :via => :post, :as => :atividade_update
  match "/processos/atividade/deletar/:id" => 'processos#destroy_atividade', :as => :atividade_deletar, :via => :get

  match "/processos/:id/edit" => 'processos#update', :as => :processo_editar, :via => :post
  match "/processos/new" => 'processos#create', :as => :processo_criar, :via => :post

  match "/projetos/new" => 'projetos#create', :as => :projeto_criar, :via => :post
  match "/projetos/:id/edit" => 'projetos#update', :as => :projeto_editar, :via => :post

  match "/comentario/new" => 'atividades#create_comentario', :as => :comentario_criar, :via => :post

  match "/portfolios/new" => 'portfolios#create', :as => :portfolio_criar, :via => :post
  match "/portfolios/:id/edit" => 'portfolios#update', :as => :portfolio_editar, :via => :post

  match '/atividades/:id' => 'atividades#show', :as => :atividade, :via => :get

  get '/dashboard' => 'portfolios#index', as: 'dashboard'
  get 'static_pages/home' => 'static_pages#home'
  get 'sessions/new'

  match "/usuarios/new" => 'usuarios#new', :as => :usuario_criar, :via => :post
  get 'usuarios/new' => 'usuarios#new'

  root 'static_pages#home'




  #get '/atividade/nova', to: 'atividades#new'
  #get '/atividade/update/:id', to: 'atividades#update'
  #get '/atividade/destroy/:id', to: 'atividades#destroy'
  #get '/atividade/edit/:id', to: 'atividades#edit'
  #get '/atividade/show/:id', to: 'atividades#show'
  #get '/atividade/index', to: 'atividades#index'
  #get '/atividade/create', to: 'atividades#create'
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
