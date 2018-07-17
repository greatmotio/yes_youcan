Rails.application.routes.draw do
	devise_for :users
	root "pages#index"
	get '/pages/show', to: 'pages#show'
	resources :users
	resources :posts
	get 'inquiry' => 'inquiry#index'              # 入力画面
	post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
	post 'inquiry/thanks' => 'inquiry#thanks'
	get 'contact', to: 'inquiry#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
