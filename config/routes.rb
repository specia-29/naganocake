Rails.application.routes.draw do

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
    get '/addresses', to: 'addresses#index'
    post '/addresses', to: 'addresses#index'
    get 'addresses/:id/edit' => 'addresses#edit', as: 'edit_address'
    patch 'addresses/:id' => 'addresses#update', as: 'update_adress'
    get 'items' => 'items#index'
    get 'items/:id' => 'items#show', as: 'show_item'
    get 'cart_items' => 'cart_items#index', as: 'cart_item'
    post 'cart_items' => 'cart_items#create'
    patch 'cart_items/:id' => 'cart_items#update', as: 'update_cart_item'
    delete 'cart_items/:id' => 'cart_items#destroy', as: 'destroy_cart_item'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all_cart_item'
  end

  namespace :admin do
    root :to => 'homes#top'
    resources :items
    resources :genres
    resources :customers
    resources :orders
    resources :order_details

  end
end

