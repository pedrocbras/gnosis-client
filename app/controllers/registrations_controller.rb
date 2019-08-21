class RegistrationsController < ::DeviseTokenAuth::RegistrationsController
  def render_create_success
    5.times { RegistrationKey.create(user: @resource) }
    @resource.reload    

    render json: {
      status: 'success',
      data: resource_data,
      registration_keys: @resource.registration_keys
    }
  end
end