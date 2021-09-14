Rails.application.routes.draw do
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #homesコントローラー用
  root to: 'homes#top'
  get '/about' => 'homes#about'

  #itemコントローラー用
  resources :items, only: [:index, :show]

  #customersコントローラー用
  get '/customers/mypage' => 'customers#show'
  get '/customers/edit' => 'customers#edit'
  patch 'customers' => 'customers#update'
  get '/customers/check' => 'customers#check'
  patch '/customers/withdrawal' => 'customers#withdrawal'

  #cart_itemsコントローラー用
  get '/cart_items' => 'cart_items#index'
  patch '/cart_items/:id' => 'cart_items#update'
  delete '/cart_items/:id' => 'cart_items#destroy'
  delete '/cart_items' => 'cart_items#destroy_all'
  post '/cart_items' => 'cart_items#create'

  #ordersコントローラー用
  get '/orders/new' => 'orders#new'
  post '/orders/check' => 'orders#check'
  get '/orders/thanks' => 'orders#thanks'
  post '/orders' => 'orders#create'
  get '/orders' => 'orders#index'
  get '/orders/:id' => 'orders#show'

end
