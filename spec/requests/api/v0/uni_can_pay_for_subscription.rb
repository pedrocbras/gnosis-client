RSpec.describe Api::V0::SubscriptionsController, type: :request do
  let(:headers) { { HTTP_ACCEPT: 'payment/json' } }
  describe 'GET /api/v0/subscriptions' do
    before { StripeMock.start }
    after { StripeMock.stop }
    context 'return 1 customer' do

      StripeMock.start
      let!(:customer) {Stripe::Customer.create(
          :email => 'fatbob@mail.com',
          :card => 'valid_card_token'
      )}
    end
  end