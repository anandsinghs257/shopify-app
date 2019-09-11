ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = '5c3342a35fa9ab38c5f74c5a8397824a'
  config.secret = 'a6ed51be143b0171c77fe17efe7a2395'
  config.old_secret = ""
  config.scope = "read_products" # Consult this page for more scope options:
                                 # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = "2019-10"
  config.session_repository = Shop
  config.webhooks = [
    {topic: 'products/update', address: 'https://tech-space.herokuapp.com/webhooks/products_update', format: 'json'},
  ]
end
