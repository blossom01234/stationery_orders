Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # 以下deviseのパス一覧
  # users/sign_in → users/sessions#new (ログイン画面)
  # users/sign_out → users/sessions#destroy (ログアウト)
  # users/password/new → devise/passwords#new (パスワード再設定のリクエスト)
  # users/password/edit → devise/passwords#edit (パスワードの変更)
  # users/confirmation/new → devise/confirmations#new (アカウント確認)
  # users/sign_up → devise/registrations#new (新規登録)
  devise_for :users, path: 'users', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_for :customers, path: 'customers', controllers: {
    sessions: 'customers/sessions'
  }
  resources :carts
  get "carts/confirm"
  resources :orders
  resources :products do
    get :price, on: :collection
    get :autocomplete_name, on: :collection
    get :autocomplete_id_name, on: :collection
  end
  resources :makers
  root "customer_product_lists#index"
  # root "customer_product_list#index"
end
