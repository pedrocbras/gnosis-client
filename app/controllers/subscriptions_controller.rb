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

    if charge.paid?
      current_user.update_attribute(:subscriber, true)
      # Some kind of success message here
    else
      # Some kind of error message here
    end
  end
end
