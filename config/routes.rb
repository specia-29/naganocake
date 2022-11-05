Rails.application.routes.draw do

  get 'homes/top'
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
  
  namespace :customer do
  end

  namespace :admin do
   root :to => 'homes#top', as: '/admin'
   resources :items
   resources :genres
   resources :customers

  end
end

