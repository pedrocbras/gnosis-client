class Api::V0::SubscriptionsController < ApplicationController
  def create
    binding.pry
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
  end
end
