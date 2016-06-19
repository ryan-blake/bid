Rails.application.config.middleware.use OmniAuth::Builder do
  provider :stripe_connect, ENV['STRIPE_CONNECT_CLIENT_ID'], ENV['SECRET_KEY']
end
