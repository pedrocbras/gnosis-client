class RegistrationsControllerController < ApplicationController
  def render_create_success

    binding.pry

    render json: {
      status: 'success',
      data: {
        user: resource_data
      }
    }
  end
end
