RSpec.describe 'User Registration', type: :request do
  let(:header) { { HTTP_ACCEPT: 'application/json' } }

  describe 'User with Research Group role signs up with Registration Key' do
    before 'post new User with Research Group role info' do
      post '/api/v0/auth', params: { email: 'example@craftacademy.se',
                                     name: 'Research Group Alpha',
                                     role: 'research_group',
                                     password: 'password',
                                     password_confirmation: 'password' },
                                     headers: headers
    end

  end

end