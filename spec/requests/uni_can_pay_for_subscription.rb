require 'stripe_mock'

describe "Subscription payment POST to /subscriptions"
  # starts Stripe Mock
  before(:each) { StripeMock.start }
  # stops Stripe Mock
  after(:each) { StripeMock.stop }
  # creates a new stripe token (what we receive from front end)
  let(:stripe_token) { StripeMock.create_test_helper.generate_card_token }
end