require 'stripe'

class Api::V0::SubscriptionsController < ApplicationController
  def create
    Stripe.api_key = 'insert test key here'

    begin
      customer =
        Stripe::Customer.create(
          email: current_user.email, source: params[:charge][:token]
        )

      charge =
        Stripe::Charge.create(
          {
            customer: customer.id,
            amount: params[:charge][:amount],
            description: params[:charge][:description],
            currency: params[:charge][:currency]
          },
          { idempotency_key: ip_key }
        )
    rescue Stripe::CardError => e
      render json: { message: 'Something bad happened. . .' },
             status: :not_acceptable
    end
  end
end
