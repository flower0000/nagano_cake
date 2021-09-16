Rails.application.routes.draw do
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #homesコントローラー用
  root to: 'homes#top'
  get '/about' => 'homes#about', as: 'about_path'

  #itemコントローラー用
  resources :items, only: [:index, :show]

  #customersコントローラー用
  get '/customers/mypage' => 'customers#show', as: 'maypage_path'
  get '/customers/edit' => 'customers#edit', as: 'customers_edit_path'
  patch 'customers' => 'customers#update', as: 'customers_update_path'
  get '/customers/check' => 'customers#check', as: 'customers_check_path'
  patch '/customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal_path'

  #cart_itemsコントローラー用
  get '/cart_items' => 'cart_items#index', as: 'cart_items_path'
  patch '/cart_items/:id' => 'cart_items#update', as: 'cart_items_update_path'
  delete '/cart_items/:id' => 'cart_items#destroy', as: 'cart_items_destroy_path'
  delete '/cart_items' => 'cart_items#destroy_all', as: 'cart_items_destroy_all_path'
  post '/cart_items' => 'cart_items#create', as: 'cart_items_create_path'

  #ordersコントローラー用
  get '/orders/new' => 'orders#new', as: 'orders_new_path'
  post '/orders/check' => 'orders#check', as: 'orders_check_path'
  get '/orders/thanks' => 'orders#thanks', as: 'thanks_path'
  post '/orders' => 'orders#create', as: 'orders_create_path'
  get '/orders' => 'orders#index', as: 'orders_index_path'
  get '/orders/:id' => 'orders#show', as: 'orders_show_path'

end
