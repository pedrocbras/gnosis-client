class Api::V0::ArticlesController < ApplicationController
  before_action :authenticate_api_v0_user!, only: [:create]
  
  def index
    articles = Article.all
    render json: articles, each_serializer: Articles::IndexSerializer
  end

  def create
    if current_api_v0_user. research_group?
      article = current_api_v0_user.articles.create!(article_params)
      render json: { message: 'Article successfully created.' } 
    else
      render json: { error: 'Invalid user role' }, status: 422
    end

  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end