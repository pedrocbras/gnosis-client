RSpec.describe 'Sessions', type: :request do
  let(:university) { FactoryBot.create(:university) }
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  describe 'POST /api/v0/auth/sign_in' do
    it 'valid credentials returns user' do
      post '/api/v0/auth/sign_in', params: { email: university.email,
                                             password: university.password
                                          }, headers: headers

      expected_response = {
        'data' => {
          'id' => university.id, 'uid' => university.email, 'email' => university.email,
          'provider' => 'email', 'name' => nil, 'nickname' => nil,
          'image' => nil, 'allow_password_change' => false
        }    
      }

      expect(response_json).to eq expected_response
    end

    it 'invalid password returns error message' do
      post '/api/v0/auth/sign_in', params: { email: university.email,
                                             password: 'wrong_password'
                                          }, headers: headers

      expect(response_json['errors'])
        .to eq ['Invalid login credentials. Please try again.']

      expect(response.status).to eq 401
    end

    it 'invalid email returns error message' do
      post '/api/v0/auth/sign_in', params: { email: 'wrong@email.com',
                                             password: university.password
                                          }, headers: headers

      expect(response_json['errors'])
        .to eq ['Invalid login credentials. Please try again.']

      expect(response.status).to eq 401
    end
  end
end

