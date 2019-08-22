RSpec.describe Api::V0::SubscriptionsController, type: :request do
  describe 'POST /api/v0/subscriptions' do
    let(:university) {create(:user, role: :university)}
    let(:credentials) {university.create_new_auth_token}
    let(:headers) {{HTTP_ACCEPT: 'application/json'}.merge!(credentials)}
    before do 
      StripeMock.start 
      post '/api/v0/subscriptions', headers: headers, params: {
        stripeToken: StripeMock.generate_card_token
      }
    end
    after { StripeMock.stop }
   
    it 'return a 200 status' do
     expect(response.status).to eq 200
    end

    it 'returns a message' do
      expect(response_json['message']).to eq 'Payment successful'
    end
  end
end