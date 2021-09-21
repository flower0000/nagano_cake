Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',#コントローラーを示している．右辺青部は階層。controllerフォルダ内のcustomersフォルダのsessions.controller.rbを通してルーティングしてあげる風に変更．
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #homesコントローラー用
  root to: 'homes#top'
  get '/about' => 'homes#about', as: 'about'

  #itemコントローラー用
  resources :items, only: [:index, :show]

  #customersコントローラー用
  get '/customers/mypage' => 'customers#show', as: 'mypage'
  get '/customers/edit' => 'customers#edit', as: 'customers_edit'
  patch 'customers' => 'customers#update', as: 'customers_update'
  get '/customers/check' => 'customers#check', as: 'customers_check'
  patch '/customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'

  #cart_itemsコントローラー用
  get '/cart_items' => 'cart_items#index', as: 'cart_items'
  patch '/cart_items/:id' => 'cart_items#update', as: 'cart_items_update'
  delete '/cart_items/:id' => 'cart_items#destroy', as: 'cart_items_destroy'
  delete '/cart_items' => 'cart_items#destroy_all', as: 'cart_items_destroy_all'
  post '/cart_items' => 'cart_items#create', as: 'cart_items_create'

  #ordersコントローラー用
  post '/orders/check' => 'orders#check', as: 'orders_check'
  get '/orders/thanks' => 'orders#thanks', as: 'thanks'
  resources :orders, only: [:new, :create, :index, :show]

 #管理者側コントローラー
 namespace :admin do
   #get '/' => 'homes#top', as: '' 名前付きルートadmin_pathにしたければこれでも
   root to: 'homes#top'
   resources :items, only:[:index, :create, :new, :edit, :show, :update]
   resources :customers, only:[:index, :show, :edit, :update]
 end

end