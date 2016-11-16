Rails.application.routes.draw do
  devise_for :users
  get '/' => 'articles#index'
  get 'users/:id' => 'users#show'

  get 'login' => 'login#show'

  resources :articles do
  	get "favorites/toggle"
  end
  post "articles/:id" => 'articles#support'
  get '/:nickname' => 'users#mypage'
end
