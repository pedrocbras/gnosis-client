RSpec.describe Api::V0::ArticlesController, type: :request do

  describe 'research group POST article' do 
    let(:rg_user) { FactoryBot.create(:user, role: :research_group) }
    let(:credentials) { rg_user.create_new_auth_token }
    let(:headers) { {HTTP_ACCEPT: "application/json"}.merge!(credentials) }
    
    before do
      post '/api/v0/articles' , params: {
        article: {
          title: 'Test article',
          body: 'Lorum lorum lorum',
          author: rg_user.name
        }
      }, headers: headers
    end

    it 'research group user creates new article' do  
      expect(response.status).to eq 200
    end

  end

  describe 'university group POST article' do 
    let(:uni_user) { FactoryBot.create(:user, role: :university) }
    let(:credentials) { uni_user.create_new_auth_token }
    let(:headers) { {HTTP_ACCEPT: "application/json"}.merge!(credentials) }
    
    before do
      post '/api/v0/articles' , params: {
        article: {
          title: 'Test article',
          body: 'Lorum lorum lorum',
          author: uni_user.name
        }
      }, headers: headers
    end

    it 'research group user creates new article' do  
      expect(response.status).to eq 422
    end

  end

end