class PaymentsController < ApplicationController
  before_filter :logged_in_only, only: :index

  def index
    @job = Job.find(params[:job_id])
    @payments = Job.find(params[:job_id]).payments
  end


  def create
    @job = Job.find(params[:job_id])
    @stripe_payment = StripeWrapper::Charge.create(amount: @job.selected_submission.price, source: params[:stripeToken],description: @job.title,application_fee: (@job.price.to_i/10), account: @job.laborer.stripe_client_id)
    if @stripe_payment.successful?
      @payment = Payment.new(name: params[:payment][:name],email: params[:payment][:email],job: @job, price: @job.price, receipt: @stripe_payment.receipt)
      @payment.save
      flash[:success] = "Your Purchase was Successful!"
      redirect_to payments_new_path(@job.client,@job,@payment,:params => {email: @payment.email})
    else
      flash[:danger] = @stripe_payment.error_message
      @client = @job.client
      @payment = Payment.new
      render :new
    end
  end

  def show
    @job = Job.find(params[:job_id])
    @payment = Payment.find(params[:id])
    if params[:email] != @payment.email
      flash[:danger] = "You are not authorised to access that page."
      redirect_to root_path
    end
  end

  def new
    @client = Client.find(params[:client_id])
    @job = Job.find(params[:job_id])
    @payment = Payment.new
  end
end
