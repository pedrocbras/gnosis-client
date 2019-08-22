RSpec.describe Api::V0::SubscriptionsController, type: :request do
  describe 'POST /api/v0/subscriptions' do
    let(:university) { create(:user, role: :university) }
    let(:credentials) { university.create_new_auth_token }
    let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }
    before do
      StripeMock.start
      post '/api/v0/subscriptions',
           headers: headers,
           params: { stripeToken: StripeMock.generate_card_token }
    end
    after { StripeMock.stop }

    it 'return a 200 status' do
      expect(response.status).to eq 200
    end

    it 'returns a success message' do
      expect(response_json['message']).to eq 'Payment successful'
    end

    it 'requires a charge amount' do
      expect {
        charge =
          Stripe::Charge.create(
            currency: 'sek', customer: university, stripeToken: :stripeToken
          )
      }.to raise_error(Stripe::InvalidRequestError)
    end

    it 'charge requires a customer' do
      expect {
        charge =
          Stripe::Charge.create(
            currency: 'sek', amount: 10_000, stripeToken: :stripeToken
          )
      }.to raise_error(Stripe::InvalidRequestError)
    end

    it 'requires a valid credit card' do
      expect {
        charge =
          Stripe::Charge.create(
            currency: 'sek', stripeToken: 'whatever dude', amount: 10_000
          )
      }.to raise_error(Stripe::InvalidRequestError)
    end
  end
end
