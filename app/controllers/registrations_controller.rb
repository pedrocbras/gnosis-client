class RegistrationsController < ApplicationController
  def render_create_success
    5.times { RegistrationKey.create(user: @resource) }
    @resouce.reload

    binding.pry 
    
    render json: {
      status: 'success',
      data: {
        registration_key: @resouce.registration_keys,
        user: resource_data
      }
    }
  end
end
