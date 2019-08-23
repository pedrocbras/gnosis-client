class Api::V0::SubscriptionsController < ApplicationController
  def create
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
  
      rescue Stripe::CardError => error  
        render_error(error.message)
  
      rescue Stripe::RateLimitError => error
        render_error(error.message)
  
      rescue Stripe::InvalidRequestError => error      
        render_error(error.message)
  
      rescue Stripe::AuthenticationError => error
        render_error(error.message)
  
      rescue Stripe::APIConnectionError => error
        render_error(error.message)
  
      rescue Stripe::StripeError => error
        render_error(error.message)
  
      rescue => e
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
      message: 'Something went wrong. . .', 
      errors: message
    }, status: 402
  end
end
