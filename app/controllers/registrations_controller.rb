class RegistrationsController < ::DeviseTokenAuth::RegistrationsController
  def render_create_success
    if @resource.role === 'university'  
      5.times { RegistrationKey.create(user: @resource) }
      @resource.reload
    end
    
    render json: {
      status: 'success',
      data: resource_data.merge(registration_keys: @resource.registration_keys)
    }
  end
end