require'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Title', text: 'Text', author_id: 1) }

  before { subject.save}

  it 'Title should be present' do
    subject.title = ''
    expect(subject).to_not be_valid
  end

  it 'Title should be string' do
    subject.title = 1
    expect(subject).to_not be_valid
  end

  it 'Title should not be too long' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter must be an integer greater than or equal to zero' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter must be an integer greater than or equal to zero' do
    subject.comments_counter = 1.2
    expect(subject).to_not be_valid
  end

  it 'LikesCounter must be an integer greater than or equal to zero' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  it 'LikesCounter must be an integer greater than or equal to zero' do
    subject.likes_counter = 1.2
    expect(subject).to_not be_valid
  end

  it 'LikesCounter should be present' do
    subject.likes_counter = ''
    expect(subject).to_not be_valid
  end
end
