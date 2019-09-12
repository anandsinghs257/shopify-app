Rails.application.routes.draw do
  root :to => 'home#index'
  get "https://tech-space-art.myshopify.com", to: "home#index"
  mount ShopifyApp::Engine, at: 'https://tech-space-art.myshopify.com'
  get 'webhooks/products/update' => 'webhooks#product_update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
