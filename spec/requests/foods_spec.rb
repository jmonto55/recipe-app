require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET /index' do
    let(:user) { User.create(name: 'Tom', email: 'tom@mail.com') }

    before(:example) do
      sign_in(user)
      get '/foods'
    end

    it 'should return success' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render index template' do
      expect(response).to render_template('index')
    end

    it 'include the correct text' do
      expect(response.body).to include('Foods')
    end
  end
end
