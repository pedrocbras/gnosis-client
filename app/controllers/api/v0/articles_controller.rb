class Api::V0::ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
end