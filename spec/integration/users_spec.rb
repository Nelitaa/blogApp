require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before(:each) do
    @user = User.create(name: 'John', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2432&q=80', bio: 'I am a user')
  end

  describe 'User index page' do
    before(:each) do
      visit users_path
    end

    it 'shows the username of all other users' do
      User.all.each do |user|
        expect(page).to have_content('John')
      end
    end

    it 'shows the profile picture for each user' do
      User.all.each do |user|
        expect(page).to have_css('img')
      end
    end

    it 'shows the number of posts each user has written' do
      User.all.each do |user|
        expect(page).to have_content('0 posts')
      end
    end

    it 'Redirected to the user show page when clicking on the username' do
      User.all.each do |user|
        click_link('John')
        expect(page).to have_current_path(user_path(user.id))
      end
    end
  end
end
