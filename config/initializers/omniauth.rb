Rails.application.config.middleware.use OmniAuth::Builder do
# frozen_string_literal: true
provider :shopify,
  ShopifyApp.configuration.api_key,
  ShopifyApp.configuration.secret,
  :redirect_uri =>  "http://localhost:3000/auth/shopify/callback",
  :callback_url => "http://localhost:3000/auth/shopify/callback",
  scope: ShopifyApp.configuration.scope,
  callback_path: '/nested/auth/shopify/callback',
  setup: lambda { |env|
    strategy = env['omniauth.strategy']

    shopify_auth_params = strategy.session['shopify.omniauth_params']&.with_indifferent_access
    shop = if shopify_auth_params.present?
      "https://#{shopify_auth_params[:shop]}"
    else
      ''
    end

    strategy.options[:client_options][:site] = shop
    strategy.options[:old_client_secret] = ShopifyApp.configuration.old_secret
  }
end
