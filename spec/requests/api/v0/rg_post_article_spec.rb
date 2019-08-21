RSpec.describe Api::V0::ArticlesController, type: :request do

  describe 'Research group can post article' do 
    let(:research_group) { FactoryBot.create(:user, role: :research_group) }
    let(:credentials) { research_group.create_new_auth_token }
    let(:headers) { {HTTP_ACCEPT: "application/json"}.merge!(credentials) }
    
    before do
      post '/api/v0/articles' , params: {
        article: {
          title: 'Test article',
          body: 'Lorum lorum lorum',
          author: research_group.name
        }
      }, headers: headers
    end

    it 'returns 200 response' do  
      expect(response.status).to eq 200
    end

  end

  describe 'University cannot post article' do 
    let(:university) { FactoryBot.create(:user, role: :university) }
    let(:credentials) { university.create_new_auth_token }
    let(:headers) { {HTTP_ACCEPT: "application/json"}.merge!(credentials) }
    
    before do
      post '/api/v0/articles' , params: {
        article: {
          title: 'Test article',
          body: 'Lorum lorum lorum',
          author: university.name
        }
      }, headers: headers
    end

    it 'returns 422 response' do  
      expect(response.status).to eq 422
    end

  end

end