class ApplicationController < ActionController::API
  def index
    render json: { message: 'Articles' }
  end
end
