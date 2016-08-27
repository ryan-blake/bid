class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = @payout

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
    #
    # charge = Stripe::Charge.create(
    #   :customer    => customer.id,
    #   :amount      => @amount,
    #   :description => 'Rails Stripe customer',
    #   :currency    => 'usd'
    # )
    charge = Stripe::Charge.create({
        :amount => @amount, # amount in cents
        :currency => "usd",
        :source => token,
        :description => "Example charge",
        :application_fee => 123 # amount in cents
      },
      {:stripe_account => CONNECTED_STRIPE_ACCOUNT_ID}
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
