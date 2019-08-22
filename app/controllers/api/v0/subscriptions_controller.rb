class Api::V0::SubscriptionsController < ApplicationController
  def create
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 10000,
      description: 'Gnosis Yearly Subscription',
      currency: 'sek'
    )

  #   if charge.paid?
  #     current_api_v0_user.update_attribute(:subscriber, true)
  #     flash_message = 'Payment Successful! You are now a subscribed University!'
  #   else
  #     flash_message = 'Something went wrong with payment. . .'
  #   end
  #   redirect_to root_path, notice: flash_message
   end

    def new
    end
  end

  