RSpec.describe Api::V0::SubscriptionsController, type: :request do
  describe 'POST /api/v0/subscriptions' do
    let(:university) {create(:user, role: :university)}
    let(:credentials) {university.create_new_auth_token}
    let(:headers) {{HTTP_ACCEPT: 'application/json'}.merge!(credentials)}
    before do 
      StripeMock.start 
      post '/api/v0/subscriptions'
    end
    after { StripeMock.stop }
   
    it '' do
    end
  end
end