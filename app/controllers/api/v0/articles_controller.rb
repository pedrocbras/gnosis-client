class Api::V0::ArticlesController < ApplicationController
  def index
    render json: { message: 'Articles' }
  end
end