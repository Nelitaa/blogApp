require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'POST index' do
    it 'returns response status success' do
      get user_posts_path(user_id: 1)
      expect(response).to have_http_status(200)
    end

    it 'renders post template' do
      get user_posts_path(user_id: 1)
      expect(response).to render_template('index')
    end

    it 'response body includes correct placeholder text' do
      get user_posts_path(user_id: 1)
      expect(response.body).to include('Posts')
    end
  end

  describe 'POST show' do
    it 'returns response status success' do
      get user_post_path(user_id: 1, id: 1)
      expect(response).to have_http_status(200)
    end

    it 'renders show template' do
      get user_post_path(user_id: 1, id: 1)
      expect(response).to render_template('show')
    end

    it 'response body includes correct placeholder text' do
      get user_post_path(user_id: 1, id: 1)
      expect(response.body).to include('Post')
    end
  end
end
