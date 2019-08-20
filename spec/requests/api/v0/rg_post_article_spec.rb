RSpec.describe Api::V0::ArticlesController, type: :request do
  let(:headers) { {HTTP_ACCEPT: "application/json"} }

  describe 'research group POST article' do 
    before 'create research group user' do
      rg_user = FactoryBot.create(:user, role: :research_group)
      # need to have rg_user sign in = WARDEN gem
    end

    it 'research group user creates new article'
      rg_article = Article.create(:article, title: 'title',
                                            body: 'body',
                                            author: rg_user.email)
    end

  end

end