Rails.application.routes.draw do

  root to: "admin/items#index"
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

  namespace :admin do
  # root => 'top#top'
   resources :items
   resources :genres
   resources :customers
  # patch 'genres/:id' => 'genres#update', as: 'update_genre'

  end
end

