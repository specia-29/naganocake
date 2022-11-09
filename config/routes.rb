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
    get '/items', to: 'items#index'
    get '/customers/mypage', to: 'customers#show'
    patch '/customers/mypage', to: 'customers#update'
    get '/public/customers/edit', to: 'customers#edit'
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

