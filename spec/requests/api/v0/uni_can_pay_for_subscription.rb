require 'stripe_mock'

describe 'Subscription Payment' do
  before { StripeMock.start }
  after { StripeMock.stop }
  let(:stripe_token) { StripeMock.create_test_helper.generate_card_token }
  let(:user) { create(:user, role: :university) }

  describe 'Subscription payment POST to /subscriptions' do
    before do
      post '/api/v0/subscriptions/create',
           params: { stripe_token: stripe_token}
    end

    it 'returns 200' do
      expect(response.status).to eq 200
    end
  end
end
