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

  #Making some routes work differently
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

  #api routes
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/users' => 'usuarios#index'
    end
  end
end
