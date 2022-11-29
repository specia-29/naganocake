Rails.application.routes.draw do

  namespace :admin do
    root :to => 'homes#top'
    resources :items
    resources :genres
    resources :customers
    resources :orders
    resources :order_details

  end
  # root to: "public/registrations#new"
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root :to => 'homes#top'
    get '/about', to: 'homes#about'
    get '/customers/mypage', to: 'customers#show'
    patch '/customers/mypage', to: 'customers#update'
    get '/public/customers/edit', to: 'customers#edit'
    get '/customers/withdrawal', to: 'customers#withdrawal'
    patch 'customers/stat_update', to: 'customers#stat_update', as: 'destroy_customer'
    get '/addresses', to: 'addresses#index'
    post '/addresses', to: 'addresses#create'
    get 'addresses/:id/edit' => 'addresses#edit', as: 'edit_address'
    patch 'addresses/:id' => 'addresses#update', as: 'update_adress'
    delete 'addresses/:id' => 'addresses#destroy', as: 'destroy_address'
    get 'items' => 'items#index'
    get 'items/:id' => 'items#show', as: 'show_item'
    get 'cart_items' => 'cart_items#index', as: 'cart_item'
    post 'cart_items' => 'cart_items#create'
    patch 'cart_items/:id' => 'cart_items#update', as: 'update_cart_item'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all_cart_item'
    delete 'cart_items/:id' => 'cart_items#destroy', as: 'destroy_cart_item'

    get 'orders/new' => 'orders#new', as: 'new_order'
    get 'orders/check' => 'orders#check', as: 'check_order'
    post 'orders/check' => 'orders#check'
    get 'orders/completion' => 'orders#completion', as: 'completion_order'
    post 'orders' => 'orders#create', as: 'create_order'
    get 'orders' => 'orders#index', as: 'order'
    get 'orders/:id' => 'orders#show', as: 'show_order'
  end


end

