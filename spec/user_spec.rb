require'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John', photo: 'https://www.google.com', bio: 'I am a user') }

  before { subject.save}

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