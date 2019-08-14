require 'rails_helper'

RSpec.describe Api::V0::ArticlesController, type: :request do
  describe 'GET /v0/articles' do
    it 'should return Articles' do
      get '/api/v0/articles'

      json_response = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(json_response['message']). to eq 'Articles'
    end
  end
end