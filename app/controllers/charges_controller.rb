class ChargesController < ApplicationController
  def new
  end

  def complete
    @charge = Charge.find(params[:charge_id])
    @job = Job.find_by(client_id: @Job.client_id, arrived: false, name: @charge.job)

    Stripe.api_key = ENV["stripe_publishable_key"]
    token = params[:token]
    charge = Stripe::Charge.create({
      :amount => @charge.price*100,
      :description => 'Rails Stripe customer',
      :customer => params[:customer_id],
      :currency => 'usd',
      :destination => @charge.laborer.uid,
      :application_fee => 200+(@charge.price*3)+ 31
      },
    )
    @charge.update_attribute(:completed, true)
    @job.update_attribute(:finished, true)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
  end

  def create
    customer = Stripe::Customer.create(
      :email => @User.email,
      :card => params[:stripeToken]
    )
    @charge = Charge.new(
    price: params[:charge]["amount"].to_i,
    client_id: current_client.id,
    laborer_id: params[:charge]["laborer_id"].to_i,
    job: params[:charge]["job"],
    token: params[:stripeToken],
    customer_id: customer.id
    )
    @charge.save

    @job = Job.where(title: @charge.job).first
    @job.client_id = @charge.client_id
    @Job.finished = false
    @job.save
  end
end
