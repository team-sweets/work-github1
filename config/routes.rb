Rails.application.routes.draw do
  # 会員側のルーティング設定
  # devise_for :customers
  # root
  
  # 管理者側のルーティング設定
  namespace :admin do
    get 'items' => 'admin/items#index'
  end
end
