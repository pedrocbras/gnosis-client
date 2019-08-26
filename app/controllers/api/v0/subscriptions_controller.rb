class Api::V0::SubscriptionsController < ApplicationController
  def create
    Stripe.api_key = 'sk_test_fGluELHNFcfBVKQvTIBU3h3e00AA6eduz6'

    if params[:stripeToken]
      begin
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
          render_error(charge.errors)
        end

      rescue => error
        render_error(error.message)
      end
    else
      render_error('No stripe token detected')
    end
    
  end

  def new; end

  private

  def render_error(message)
    render json: { 
      errors: message
    }, status: 402
  end
end
