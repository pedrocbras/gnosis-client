RSpec.describe 'Subscription POST to /subscriptions', type: :request do
  let(:stripe_helper) { StripeMock.create_test_helper }
  let(:headers) { {HTTP_ACCEPT: "application/json"} }
  let(:user) { create(:user, role: :university) }
  before { StripeMock.start }
  after { StripeMock.stop }

    describe 'Subscription payment POST to /subscriptions' do
      # This doesn't touch stripe's servers nor the internet!
      # Specify :source in place of :card (with same value) to return customer with source data
      customer = Stripe::Customer.create({
        email: 'johnny@appleseed.com',
        source: stripe_helper.generate_card_token
      })
      expect(customer.email).to eq('johnny@appleseed.com')
    end
end
