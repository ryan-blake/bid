  Rails.configuration.stripe = {
    :publishable_key => ENV['stripe_publishable_key'],
    :secret_key      => ENV['SECRET_KEY']
  }

  # Set our app-stored secret key with Stripe
  Stripe.api_key = Rails.configuration.stripe[:secret_key]

# puppy demo >>>
  # Rails.configuration.stripe = {
  #   :publishable_key => ENV["stripe_publishable_key"],
  #   :secret_key      => ENV["stripe_api_key"]
  # }
  # Stripe.api_key = Rails.configuration.stripe[:secret_key]
