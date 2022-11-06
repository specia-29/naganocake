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

  namespace :public do
    resources :homes
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

