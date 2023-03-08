require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  describe 'GET index' do
    it 'returns response status success' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'renders index template' do
      get users_path
      expect(response).to render_template('index')
    end

    it 'response body includes correct placeholder text' do
      get users_path
      expect(response.body).to include('Users')
    end
  end

  describe 'GET show' do
    it 'returns response status success' do
      get user_path(id: 1)
      expect(response).to have_http_status(200)
    end

    it 'renders show template' do
      get user_path(id: 1)
      expect(response).to render_template('show')
    end

    it 'response body includes correct placeholder text' do
      get user_path(id: 1)
      expect(response.body).to include('User')
    end
  end
end
