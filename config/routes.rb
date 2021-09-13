Rails.application.routes.draw do
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #homesコントローラー用
  root to: 'homes#top'
  get '/about' => 'homes#about'
  
  
  
end
