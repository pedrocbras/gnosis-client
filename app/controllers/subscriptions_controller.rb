class Api::V0::SubscriptionsController < ApplicationController
  def create
   
    customer =
      Stripe::Customer.create(
        email: params[:stripeEmail], source: params[:stripeToken]
      )

    charge =
      Stripe::Charge.create(
        customer: customer.id,
        amount: 10_000,
        description: 'Gnosis Yearly Subscription',
        currency: 'SEK'
      )

    if charge.paid?
      current_user.update_attribute(:subscriber, true)
      render json: { message: 'Payment was successful!' }
    else
      render json: { message: 'Whoops! There was an error with payment.' },
             status: :not_acceptable
    end
  end
end
