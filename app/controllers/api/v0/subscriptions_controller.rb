class Api::V0::SubscriptionsController < ApplicationController
  def create
    customer =
      Stripe::Customer.create(
        email: current_api_v0_user.email, source: params[:stripeToken]
      )

    charge =
      Stripe::Charge.create(
        customer: customer.id,
        amount: 10_000,
        description: 'Gnosis Yearly Subscription',
        currency: 'sek'
      )

    if charge.paid?
      current_api_v0_user.update_attribute(:subscriber, true)
      render json: { message: 'Payment successful' }
    else
      render json: { message: 'Something went wrong. . .' }
    end
  end

  def new; end
end
