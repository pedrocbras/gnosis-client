# RSpec.describe 'User Registration', type: :request do
#   let(:header) { { HTTP_ACCEPT: 'application/json' } }

#   describe 'User with Research Group role signs up with Registration Key' do
#     before 'post new User with Research Group role info' do
#       post '/api/v0/auth', params: { email: 'example@craftacademy.se',
#                                      name: 'Research Group Alpha',
#                                      role: 'research_group',
#                                      password: 'password',
#                                      password_confirmation: 'password',
#                                      registration_key: 'registration_key' },
#                                      headers: headers
#     end

#     it 'returns a 200 response if post request was successful' do
#       expect(response.status).to eq 200
#     end

#     it 'verifies that User with Research Group role is created' do
#       name = User.last.name
#       expect(name).to eq 'Research Group Alpha'
#     end

#     it 'verifies that created user have a Registration key' do
#       registration_key = User.last.registration_key
#       expect(registration_key).to eq '8288912'
#     end
  
#   end

# end

RSpec.describe 'Research Group Registration', type: :request do
  let(:header) { { HTTP_ACCEPT: 'application/json' } }

  describe 'with valid credentials' do
    before 'posting data to URL' do
      post '/api/v0/auth', params: { email: 'maria@craftacademy.se',
                                     name: 'Fat Jesus',
                                     role: 'research_group',
                                     password: 'password',
                                     password_confirmation: 'password' },
                                     headers: headers
    end

    it 'returns a 200 response' do
      expect(response.status).to eq 200
    end

    it 'returns 0 registration keys' do
      expect(response_json['data']['registration_keys'].count).to eq 0
    end
  end
end