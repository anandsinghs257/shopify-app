ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = '5c3342a35fa9ab38c5f74c5a8397824a'
  config.secret = 'a6ed51be143b0171c77fe17efe7a2395'
  config.old_secret = ""
  config.scope = "read_products" # Consult this page for more scope options:
                                 # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = "2019-07"
  config.session_repository = Shop
  config.root_url = 'tech-space-art.myshopify.com'
  config.webhooks = [
    {topic: 'app/uninstalled', address: 'http//:tech-space.herokuapp.com/webhooks/app_uninstalled', format: 'json'},
    {topic: 'carts/update', address: 'http//:tech-space.herokuapp.com/webhooks/carts_update', format: 'json'},
  ]
end

# ShopifyApp::Utils.fetch_known_api_versions                        # Uncomment to fetch known api versions from shopify servers on boot
# ShopifyAPI::ApiVersion.version_lookup_mode = :raise_on_unknown    # Uncomment to raise an error if attempting to use an api version that was not previously known
