include Warden::Test::Helpers

RSpec.describe Api::V0::ArticlesController, type: :request do
  let(:headers) { {HTTP_ACCEPT: "application/json"} }

  describe 'research group POST article' do 
    before 'create research group user' do
      rg_user = FactoryBot.create(:user, role: :research_group)
      login_as(rg_user, scope: :user)
      binding.pry
    end

    it 'research group user creates new article' do
      #rg_article = Article.create(:article, title: 'title',
      #                                      body: 'body',
      #                                      author: rg_user.email)
    end

  end

end

Warden.test_reset!