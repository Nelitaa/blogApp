require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John', photo: 'https://www.google.com', bio: 'I am a user') }

  before { subject.save }

  it 'name should be present' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'name should be string' do
    subject.name = 1
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be an integer greater than or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be an integer greater than or equal to zero' do
    subject.posts_counter = 1.2
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be an integer greater than or equal to zero' do
    subject.posts_counter = 1
    expect(subject).to be_valid
  end
end

RSpec.describe UsersController, type: :request do
  describe 'GET #index' do
    it 'returns a success response' do
      get users_url
      expect(response).to have_http_status(200)
    end

    it 'response body includes the user name' do
      user = User.create!(name: 'John', photo: 'https://www.google.com', bio: 'I am a user')
      get users_url
      expect(response.body).to include(user.name)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      user = User.create!(name: 'John', photo: 'https://www.google.com', bio: 'I am a user')
      get user_url(user)
      expect(response).to be_successful
    end

    it 'response body includes the user name' do
      user = User.create!(name: 'John', photo: 'https://www.google.com', bio: 'I am a user')
      get user_url(user)
      expect(response.body).to include(user.name)
    end
  end
end